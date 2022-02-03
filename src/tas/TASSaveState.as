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
		public var keysTimer:Object;
		public var levelTime: Number;
		public var orangeSwitches: Object;
		
		// player
		public var purpleSwitches: Object;
		public var rank: int;
		public var isInvulnerable: Boolean;
		public var hasLevitation: Boolean;
		public var currentThrust: Number;
		public var slippery: Number;
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
		public var deadoffset:Number;
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
		public var cursed:Boolean;
		public var curseTimeStart:Number;
		public var curseDuration:Number;
		
		public var zombie:Boolean;
		public var zombieTimeStart:Number;
		public var zombieDuration:Number;
		
		public var isOnFire:Boolean;
		public var fireTimeStart:Number;
		public var fireDuration:Number;
		
		public var poison:Boolean;
		public var poisonTimeStart:Number;
		public var poisonDuration:Number;
		
		
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
			
			levelTime = Global.playState.ticks;
			
			keysTimer = new Object();
			for (var color:String in world.keysTimer)
				keysTimer[color] = world.keysTimer[color];
				
			orangeSwitches = new Object();
			for (var orangeSwitchId:String in world.orangeSwitches)
				orangeSwitches[orangeSwitchId] = world.orangeSwitches[orangeSwitchId];
			
			
			// player
			var player: Player = Global.playState.player;
			
			purpleSwitches = new Object();
			for (var purpleSwitchId:String in player.switches)
				purpleSwitches[purpleSwitchId] = player.switches[purpleSwitchId];
				
			
			// rank = 
			
			
			slippery = player.slippery;
			
			time = Global.playState.player.ticks;
			
			hascrown = player.hascrown;
			hascrownsilver = player.hascrownsilver;
			
			// save gold coins
			gx = new Array();
			gy = new Array();
			for (var ig: int = 0; ig < player.gx.length; ig++ ) {
				gx[ig] = (player.gx[ig]);
				gy[ig] = (player.gy[ig]);
			}
			
			
			// save blue coins
			bx = new Array();
			by = new Array();
			for (var ib: int = 0; ib < player.bx.length; ib++ ) {
				bx[ib] = (player.bx[ib]);
				by[ib] = (player.by[ib]);
			}
			
			jumpCount = player.jumpCount;
			maxJumps = player.maxJumps;
			
			hasLevitation = player.hasLevitation;
			currentThrust = player._currentThrust;
			
			low_gravity = player.low_gravity;
			speedBoost = player.speedBoost;
			flipGravity = player.flipGravity;
			jumpBoost = player.jumpBoost;
			isInvulnerable = player.isInvulnerable;
			
			cursed = player.cursed;
			curseDuration = player.curseDuration;
			curseTimeStart = player.curseTimeStart;
			
			zombie = player.zombie;
			zombieDuration = player.zombieDuration;
			zombieTimeStart = player.zombieTimeStart;
			
			isOnFire = player.isOnFire;
			fireDuration = player.fireDuration;
			fireTimeStart = player.fireTimeStart;
			
			poison = player.poison;
			poisonDuration = player.poisonDuration;
			poisonTimeStart = player.poisonTimeStart;
			
			
			deaths = player.deaths;
			
			isDead = player.isDead;
			deadoffset = player.deadoffset;
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
			
			//curseTicks = player.curseTicks;
		    //zombieTicks = player.zombieTicks;
			//fireTicks = player.fireTicks;
			//poisonTicks = player.poisonTicks;
			
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
			
			Global.playState.ticks = levelTime;
			
			world.keysTimer = new Object();
			for (var color:String in keysTimer) {
				world.keysTimer[color] = keysTimer[color];
				world.setKey(color, keysTimer[color], true);
			}
			
			Global.playState.pressOrangeSwitch(1000, false)
			for (var orangeSwitchId:String in orangeSwitches)
				if(orangeSwitches[orangeSwitchId])
					Global.playState.pressOrangeSwitch(int(orangeSwitchId), true);
				
			
			// player
			var player: Player = Global.playState.player;
			
			player.pressPurpleSwitch(1000, false)
			for (var purpleSwitchId:String in purpleSwitches)
				if(purpleSwitches[purpleSwitchId])
					player.pressPurpleSwitch(int(purpleSwitchId), true);
				
			
			// rank
			
			
			player.slippery = slippery;
			
			Global.playState.player.ticks = time;
			
			player.hascrown = hascrown;
			player.hascrownsilver = hascrownsilver;
			Global.playState.player.completed = hascrownsilver;
			Global.playState.checkCrown(hascrown);
			Global.playState.checkSilverCrown(hascrownsilver);
			
			Global.playState.getWorld().resetCoins();
			
			// restore gold coins
			player.gx = new Array();
			player.gy = new Array();
			player.coins = 0;
			if (gx) {
				Global.playState.restoreCoins(gx, gy, false);
			}
			
			// restore blue coins
			player.bx = new Array();
			player.by = new Array();
			player.bcoins = 0;
			if (bx) {
				Global.playState.restoreCoins(bx, by, true);
			}
			
			player.setEffect(Config.effectMultijump, maxJumps != 1, maxJumps);
			player.jumpCount = jumpCount;
			
			player.setEffect(Config.effectFly, hasLevitation);
			player._currentThrust = currentThrust;
			
			player.setEffect(Config.effectLowGravity, low_gravity);
			player.setEffect(Config.effectRun, speedBoost != 0, speedBoost);
			player.setEffect(Config.effectJump, jumpBoost != 0, jumpBoost);
			player.setEffect(Config.effectProtection, isInvulnerable);
			player.setEffect(Config.effectGravity, flipGravity != 0, flipGravity);
			
			player.setEffect(Config.effectCurse, cursed, curseTimeStart, curseDuration/100 - 2*Global.ping);
			player.setEffect(Config.effectZombie, zombie, zombieTimeStart, zombieDuration/100 - 2*Global.ping);
			player.setEffect(Config.effectFire, isOnFire, fireTimeStart, fireDuration/100 - 2*Global.ping);
			player.setEffect(Config.effectPoison, poison, poisonTimeStart, poisonDuration/100 - 2*Global.ping);
			
			Global.ui2.effectDisplay.update();
			
			player.deaths = deaths;
			
			player.isDead = isDead;
			player.deadoffset = deadoffset;
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
			//player.curseTicks = curseTicks;
		    //player.zombieTicks = zombieTicks;
			//player.fireTicks = fireTicks;
			//player.poisonTicks = poisonTicks;
			
			player.enforceMovement = enforceMovement;
			
			player.cx = cx;
			player.cy = cy;
			
			player.donex = donex;
			player.doney = doney;
			
			player.animoffset = animoffset;
			
			player.currentSX = currentSX;
			player.currentSY = currentSY;
			
			if (TASGlobal.userInputs != null) {
				TASGlobal.userInputs.position = levelTime;
			}
		}
	}

}