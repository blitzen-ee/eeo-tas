package tas 
{
	import Global;
	import Config;
	import flash.utils.ByteArray;
	
	public class TASSaveState 
	{
		// other
		public var writeHead:int;
		public var userInputs:ByteArray = null;
		
		// world
		public var hideTimedoorOffset:Number = 0;
		
		// player
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
		
		public var tilequeue:Array;
		public var queue:Vector.<int>;
		public var current:int;
		public var current_below:int;
		public var morx:int;
		public var mory:int;
		public var mox:int;
		public var moy:int;
		public var mx:Number;
		public var my:Number;
		public var modifierX:Number;
		public var modifierY:Number;
		
		public var pastx:int;
		public var pasty:int; // lol
		
		public var horizontal:int;
		public var vertical:int;
		
		public var oh:int;
		public var ov:int;
		public var ox:Number;
		public var oy:Number;
		
		// effects
		public var curseTicks:Number;
		public var zombieTicks:Number;
		public var fireTicks:Number;
		public var poisonTicks:Number;
		
		public var enforceMovement:Boolean;
		
		public var cx:int;
		public var cy:int;
		
		public var donex:Boolean;
		public var doney:Boolean;
		
		public var animoffset:Number;
		
		public var currentSX:Number;
		public var currentSY:Number;
		
		public function TASSaveState() 
		{
			x = -1;
			y = -1;
		}
		
		public function save():void 
		{
			if (TASGlobal.userInputs != null) {
				userInputs = new ByteArray();
				for (var inputsIdx: int = 0; inputsIdx < TASGlobal.userInputs.length; inputsIdx++) {
					userInputs.writeByte(TASGlobal.userInputs[inputsIdx]);
				}
			}
			
			//world
			var world:World = Global.playState.world;
			
			//hideTimedoorOffset = world.hideTimedoorOffset;
			
			// player
			var player: Player = Global.playState.player;
			
			
			
			switches = player.switches;
			
			// rank = 
			
			isVulnerable = player.isInvulnerable;
			hasLevitation = player.hasLevitation;
			
			time = Global.playState.player.ticks;
			
			hascrown = player.hascrown;
			hascrownsilver = player.hascrownsilver;
			
			gx = new Array();
			for (var igx: int = 0; igx < player.gx.length; igx++ ) {
				gx[igx] = (player.gx[igx]);
			}
			
			gy = new Array();
			for (var igy: int = 0; igy < player.gy.length; igy++ ) {
				gy[igy] = (player.gy[igy]);
			}
			
			low_gravity = player.low_gravity;
			jumpCount = player.jumpCount;
			maxJumps = player.maxJumps;
			speedBoost = player.speedBoost;
			
			// save blue coins
			bx = new Array();
			for (var ibx: int = 0; ibx < player.bx.length; ibx++ ) {
				bx[ibx] = (player.bx[ibx]);
			}
			
			by = new Array();
			for (var iby: int = 0; iby < player.by.length; iby++ ) {
				by[iby] = (player.by[iby]);
			}
			
			
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
			
			tilequeue = new Array();
			for (var tile:int = 0; tile < player.tilequeue.length; tile++) {
				tilequeue[tile] = player.tilequeue[tile];
			}
			
			queue = new Vector.<int>(Config.physics_queue_length);
			for (var q:int = 0; q < player.queue.length; q++) {
				queue[q] = player.queue[q]
			}
			
			current = player.current;
			current_below = player.current_below;
			morx = player.morx;
			mory = player.mory;
			mox = player.mox;
			moy = player.moy;
			mx = player.mx;
			my = player.my;
			modifierX = player.modifierX;
			modifierY = player.modifierY;
			
			pastx = player.pastx;
			pasty = player.pasty;
			
			horizontal = player.horizontal;
			vertical = player.vertical;
			
			oh = player.oh;
			ov = player.ov;
			ox = player.ox;
			oy = player.oy;
			
			curseTicks = player.curseTicks;
		    zombieTicks = player.zombieTicks;
			fireTicks = player.fireTicks;
			poisonTicks = player.poisonTicks;
			
			enforceMovement = player.enforceMovement;
			
			cx = player.cx;
			cy = player.cy;
			
			donex = player.donex;
			doney = player.doney;
			
			animoffset = player.animoffset;
			
			currentSX = player.currentSX;
			currentSY = player.currentSY;
		}
		
		
		public function load():void
		{
			if (userInputs != null) {
				TASGlobal.userInputs = new ByteArray();
				for (var inputIdx: int = 0; inputIdx < userInputs.length; inputIdx++) {
					TASGlobal.userInputs.writeByte(userInputs[inputIdx]);
				}
			}
			
			
			//world
			var world:World = Global.playState.world;
			
			//world.hideTimedoorOffset = hideTimedoorOffset;
			
			// player
			var player: Player = Global.playState.player;
			player.switches = switches;
			
			// rank
			
			player.isInvulnerable = isVulnerable;
			player.hasLevitation = hasLevitation;
			
			Global.playState.player.ticks = time;
			
			player.hascrown = hascrown;
			player.hascrownsilver = hascrownsilver;
			
			Global.playState.getWorld().resetCoins();
			player.coins = 0;
			// restore gold coins
			if (gx) {
				Global.playState.restoreCoins(gx, gy, false);
			}
			player.gx = new Array();
			for (var igx: int = 0; igx < gx.length; igx++ ) {
				player.gx[igx] = gx[igx];
			}
			
			player.gy = new Array();
			for (var igy: int = 0; igy < gy.length; igy++ ) {
				player.gy[igy] = gy[igy];
			}
			
			player.low_gravity = low_gravity;
			player.jumpCount = jumpCount;
			player.maxJumps = maxJumps;
			player.speedBoost = speedBoost;
			
			// restore blue coins
			player.bcoins = 0;
			if (bx) {
				Global.playState.restoreCoins(bx, by, true);
			}
			player.bx = new Array();
			for (var ibx: int = 0; ibx < bx.length; ibx++ ) {
				player.bx[ibx] = bx[ibx];
			}
			
			player.by = new Array();
			for (var iby: int = 0; igy < by.length; iby++ ) {
				player.by[iby] = by[iby];
			}
			
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
			
			player.tilequeue = new Array();
			for (var tile:int = 0; tile < tilequeue.length; tile++) {
				player.tilequeue[tile] = tilequeue[tile];
			}
			
			player.queue = new Vector.<int>(Config.physics_queue_length);
			for (var q:int = 0; q < queue.length; q++) {
				player.queue[q] = queue[q];
			}
			
			player.current = current;
			player.current_below = current_below;
			player.morx = morx;
			player.mory = mory;
			player.mox = mox;
			player.moy = moy;
			player.mx = mx;
			player.my = my;
			player.modifierX = modifierX;
			player.modifierY = modifierY;
			
			player.pastx = pastx;
			player.pasty = pasty;
			
			player.horizontal = horizontal;
			player.vertical = vertical;
			
			player.oh = oh;
			player.ov = ov;
			player.ox = ox;
			player.oy = oy;
			
			// effects
			player.curseTicks = curseTicks;
		    player.zombieTicks = zombieTicks;
			player.fireTicks = fireTicks;
			player.poisonTicks = poisonTicks;
			
			player.enforceMovement = enforceMovement;
			
			player.cx = cx;
			player.cy = cy;
			
			player.donex = donex;
			player.doney = doney;
			
			player.animoffset = animoffset;
			
			player.currentSX = currentSX;
			player.currentSY = currentSY;
			
			if (TASGlobal.userInputs != null) {
				TASGlobal.userInputs.position = time;
			}
		}
	}

}