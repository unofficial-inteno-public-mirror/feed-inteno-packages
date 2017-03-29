#!/bin/bash

function extract_core {
	initial_commit=1427738ac4b77f474999ae21af1a8b916468df36
	topdir=$(pwd)

	# Paths to packages that should be exported.
	paths+='package/network/services/samba36 '
	paths+='package/network/services/dnsmasq '
	paths+='package/network/services/dropbear '
	paths+='package/network/services/odhcpd '
	paths+='package/network/config/firewall '
	paths+='package/network/config/netifd '
	paths+='package/network/config/qos-scripts '
	paths+='package/network/utils/iproute2 '
	paths+='package/network/utils/curl '
	paths+='package/utils/busybox '

	function print_usage {
		echo "Usage: $0 extract_core"
		echo "  -p <path-to-package> | default"
		echo "  -r <import-repo>"
		echo "  -b <import-branch>"
		echo ""
		echo "Example: $0 extract_core"
		echo "  -p package/utils/busybox"
		echo "  -r feeds/feed_inteno_openwrt"
		echo "  -b devel"
	}

	function orphan_branch {
		local branch=$1

		git checkout --orphan $branch
		git rm -rf --cached *
		git rm -rf --cached .empty
		rm -rf *
		rm -rf .empty
	}

	function export_core {
		local path=$1

		echo "Extracting ${path} from core to ${import_repo}:${import_branch}"

		# Generate patches from start of openwrt repo.
		mkdir -p patches
		repo=$(basename $path)
		dir=$(dirname $path)
		git format-patch $initial_commit $path -o patches

		# Remove dirname from patches to commit the packages to the
		# top directory in the destination repo.
		ls patches | while read line; do
			sdir=$(echo "$dir/" | sed 's/\//\\\//g')
			sed -i "s/$sdir//g" patches/$line
		done
		
		cd $import_repo
		
		if [ -n "$(git rev-parse -q --verify remotes/origin/$repo)" ]; then
			# Create temporary branch to apply patches on.
			# We need to do this as git am does not like it
			# when patches have already been applied.
			orphan_branch tmp
			git am $topdir/patches/*
			
			# Rebase and merge.
			git rebase origin/$repo
			git checkout --track -b $repo origin/$repo
			git merge tmp
			git br -d tmp
		else
			# Remote branch does not exist for packet so create it.
			orphan_branch $repo
			git am $topdir/patches/*		
		fi

		git push origin $repo
		
		# Merge the package branch into the main branch.
		git checkout $import_branch
		git merge $repo -m "Syncing $repo"
		git push origin $import_branch
		git br -d $repo
		
		rm -rf $topdir/patches
		cd $topdir
	}

	# Execute user command
	while getopts "p:r:b:h" opt; do
		case $opt in
			p)
				export_path=${OPTARG}
				;;
			r)
				import_repo=${OPTARG}
				;;
			b)
				import_branch=${OPTARG}
				;;
			h)
				print_usage
				exit 1
				;;
			\?)
				print_usage
				exit 1
				;;
		esac
	done

	if [ ! -n "$export_path" ] || [ ! -n "$import_repo" ] || [ ! -n "$import_branch" ]; then
   		print_usage
		exit 1
	fi

	if [ "$export_path" == "default" ]; then
		echo "Extracting default packages:"
		for p in $paths; do
			export_core $p

		done
	else
		export_core $export_path
	fi

	exit 0
}

register_command "extract_core" "Extract core package to separate feed"


