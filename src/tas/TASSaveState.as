package tas 
{
	import Global;
	
	public class TASSaveState 
	{
		public var switches: Object;
		public var rank: int;
		public var isVulnerable: Boolean;
		public var hasLevitation: Boolean;
		public var time: Number;
		public var hascrown: Boolean;
		public var hascrownsilver: Boolean;
		public var gx: Array;
		public var gy: Array;
		public var low_gravity: Boolean;
		public var jumpCount: int;
		public var maxJumps: int;
		public var speedBoost: int;
		public var bx: Array;
		public var by: Array;
		public var flipGravity: int;
		public var deaths: int;
		public var jumpBoost: int;
		public var isDead: Boolean;
		public var worldSpawn: int;
		public var x: Number;
		public var y: Number;
		public var speedx: Number;
		public var speedy: Number;
		public var checkpointx: int;
		public var checkpointy: int;
		public var team: int;
		public var camx: int;
		public var camy: int;
		
		public function TASSaveState() 
		{
		
		}
		
		public function save():void 
		{
			var player: Player = Global.playState.player;
			
			switches = player.switches;
			
			// rank = 
			
			isVulnerable = player.isInvulnerable;
			hasLevitation = player.hasLevitation;
			
			time = Global.playState.player.ticks;
			
			hascrown = player.hascrown;
			hascrownsilver = player.hascrownsilver;
			
			gx = player.gx;
			gy = player.gy;
			
			low_gravity = player.low_gravity;
			jumpCount = player.jumpCount;
			maxJumps = player.maxJumps;
			speedBoost = player.speedBoost;
			
			bx = player.bx;
			by = player.by;
			
			flipGravity = player.flipGravity;
			deaths = player.deaths;
			jumpBoost = player.jumpBoost;
			isDead = player.isDead;
			worldSpawn = player.worldSpawn;
			
			x = player.x;
			y = player.y;
			
			speedx = player.speedX;
			speedy = player.speedY;
			
			checkpointx = player.checkpoint_x;
			checkpointy = player.checkpoint_y;
			
			camx = Global.playState.x;
			camy = Global.playState.y;
			team = player.team;
		}
		
		
		public function load():void
		{
			var player: Player = Global.playState.player;
			player.switches = switches;
			
			// rank
			
			player.isInvulnerable = isVulnerable;
			player.hasLevitation = hasLevitation;
			
			Global.playState.player.ticks = time;
			
			player.hascrown = hascrown;
			player.hascrownsilver = hascrownsilver;
			
			player.gx = gx;
			player.gy = gy;
			
			player.low_gravity = low_gravity;
			player.jumpCount = jumpCount;
			player.maxJumps = maxJumps;
			player.speedBoost = speedBoost;
			
			player.bx = bx;
			player.by = by;
			
			player.flipGravity = flipGravity;
			player.deaths = deaths;
			player.jumpBoost = jumpBoost;
			player.isDead = isDead;
			player.worldSpawn = worldSpawn;
			
			player.x = x;
			player.y = y;
			
			player.speedX = speedx;
			player.speedY = speedy;
			
			player.checkpoint_x = checkpointx;
			player.checkpoint_y = checkpointy;
			
			Global.playState.x = camx;
			Global.playState.y = camy;
			
			player.team = team;
			
			if (TASGlobal.userInputs != null) {
				TASGlobal.userInputs.position = time;
			}
		}
	}

}