//! Author: Martin K. Schröder <mkschreder.uk@gmail.com>

JUCI.app
.controller("StatsOverviewCtrl", function ($scope, $uci, $rpc, gettext) {
	//$scope.expanded = false; 
	$scope.sections = [{}, {}, {}]; 
	
	JUCI.interval.repeat("status.refresh", 2000, function(resume){
		async.series([
			function(next){
				$uci.sync("boardpanel").done(function(){ next(); }); 
			}, 
			function(next){
				$rpc.network.interface.dump().done(function(result){
					_interfaces = result.interface; 
					next(); 
				}); 
			}, 
			function(next){
				var sections = []; 
				[
					{ name: gettext("Internet"), value: $uci.boardpanel.network.internet.value||"wan" }, 
					{ name: gettext("Voice"), value: $uci.boardpanel.network.voice.value }, 
					{ name: gettext("IPTV"), value: $uci.boardpanel.network.iptv.value }
				]
				.filter(function(x){ return x.value != "" })
				.forEach(function(x, c){ 
					sections.push({
						"name": x.name, 
						"interface": _interfaces.find(function(i){ return i.interface == x.value; })
					});  
				}); 
				sections = sections.sort(function(a, b) { return a.interface.up > b.interface.up; }); 
				for(var c = 0; c < sections.length; c++){
					var sec = sections[c]; 
					if(sec.interface.up) sec.status = "ok"; 
					else if(sec.interface.pending) sec.status = "progress"; 
					else sec.status = "error"; 
					Object.assign($scope.sections[c], sec);
				} 
				$scope.$apply(); 
				next(); 
			}, 
			function(next){
				$rpc.router.dslstats().done(function(result){
					switch(result.dslstats.status){
						case 'Idle': $scope.dsl_status = 'error'; break; 
						case 'Showtime': $scope.dsl_status = 'ok'; break; 
						default: $scope.dsl_status = 'progress'; break; 
					}
					$scope.dslinfo = result.dslstats; 
					$scope.$apply(); 
					next(); 
				}); 
			}
		], function(){
			resume(); 
		}); 
	}); 
}); 
