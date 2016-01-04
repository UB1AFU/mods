--[[
	--- This is Wilson's speech file for Don't Starve Together ---
	Write your character's lines here.
	If you want to use another speech file as a base, or use a more up-to-date version, get them from data\scripts\
	
	If you want to use quotation marks in a quote, put a \ before it.
	Example:
	"Like \"this\"."
]]
return {
	ACTIONFAIL =
	{
		SHAVE =
		{
			AWAKEBEEFALO = "Why would I do that when the beast is awake?",
			GENERIC = "I won't shave that.",
			NOBITS = "There clearly isn't anything left to shave..",
		},
		STORE =
		{
			GENERIC = "I can't do that. It's full.",
			NOTALLOWED = "Nope. Can't do that..",
			INUSE = "Hurry up already! I'm waiting for my turn!",
		},
		RUMMAGE =
		{	
			GENERIC = "Nope. Can't do that..",
			INUSE = "Hurry up already! I'm waiting for my turn!",	
		},
        COOK =
        {
            GENERIC = "Nope. Can't do that..",
            INUSE = "Hurry up already! I'm waiting for my turn!",
            TOOFAR = "No! It's too far away!",
        },
        GIVE =
        {
            DEAD = "I'm not touching that..",
            SLEEPING = "Clearly sleeping. Maybe later..",
            BUSY = "I guess I'll do it later..",
        },
        GIVETOPLAYER = 
        {
        	FULL = "Empty your pockets already! They are full!",
            DEAD = "I'm not touching that..",
            SLEEPING = "Clearly sleeping. Maybe later..",
            BUSY = "I guess I'll do it later..",
    	},
    	GIVEALLTOPLAYER = 
        {
        	FULL = "Empty your pockets already! They are full!",
            DEAD = "I'm not touching that..",
            SLEEPING = "Clearly sleeping. Maybe later..",
            BUSY = "I guess I'll do it later..",
    	},
        WRITE =
        {
            GENERIC = "Nope. Can't do that.",
            INUSE = "I should wait for my turn I guess..",
        },
        CHANGEIN =
        {
            GENERIC = "Nope. Can't do that.",
            BURNING = "Nope. I won't be touching that!",
            INUSE = "I should wait for my turn..",
        },
        ATTUNE =
        {
            NOHEALTH = "I don't feel like it..",
        },
	},
	ACTIONFAIL_GENERIC = "Nope. Can't do that.",
	ANNOUNCE_ADVENTUREFAIL = "That went horribly wrong..",
	ANNOUNCE_BEES = "I HATE those horrible insects..",
	ANNOUNCE_BOOMERANG = "Damn it! I failed again..",
	ANNOUNCE_CHARLIE = "What the hell is going on?",
	ANNOUNCE_CHARLIE_ATTACK = "Oh god. What the hell just bit me?!",
	ANNOUNCE_COLD = "MUUTA",
	ANNOUNCE_HOT = "I can't.. Feel.. My face..Too hot..",
	ANNOUNCE_CRAFTING_FAIL = "I just completely ruined that. Great..",
	ANNOUNCE_DEERCLOPS = "Holy crap. What the hell was that?!",
	ANNOUNCE_DUSK = "It's getting dark and depressing..",
	ANNOUNCE_EAT =
	{
		GENERIC = "I guess this tastes OK.",
		PAINFUL = "Oh dear god!",
		SPOILED = "Oh GOD I think I'm going to vomit!",
		STALE = "This tastes horrible..",
		INVALID = "Why would I eat that?",
		YUCKY = "Now why the HELL would I eat that?",
	},
	ANNOUNCE_ENTER_DARK = "I can't see. Great...",
	ANNOUNCE_ENTER_LIGHT = "Oh would you look at that.",
	ANNOUNCE_FREEDOM = "I'm free!",
	ANNOUNCE_HIGHRESEARCH = "I feel like less of an idiot now.",
	ANNOUNCE_HOUNDS = "Who the HELL let the dogs out!?",
	ANNOUNCE_WORMS = "What the hell is going on!?",
	ANNOUNCE_HUNGRY = "I'm so god damn hungry..",
	ANNOUNCE_HUNT_BEAST_NEARBY = "Great. The owner of these is nearby..",
	ANNOUNCE_HUNT_LOST_TRAIL = "Nope. Nothing to be found here..",
	ANNOUNCE_HUNT_LOST_TRAIL_SPRING = "Damn great! Ground is too wet so I lost the tracks!",
	ANNOUNCE_INV_FULL = "I'm already carrying all that I damn can!",
	ANNOUNCE_KNOCKEDOUT = "God damn what a pain..",
	ANNOUNCE_LOWRESEARCH = "Yup. I feel like an idiot. Didn't learn a thing..",
	ANNOUNCE_MOSQUITOS = "Piss off!",
    ANNOUNCE_NOWARDROBEONFIRE = "I'm not going to do that!",
    ANNOUNCE_NODANGERGIFT = "I'm not going to do that!",
	ANNOUNCE_NODANGERSLEEP = "I'm not going to do that!",
	ANNOUNCE_NODAYSLEEP = "I can't sleep now!",
	ANNOUNCE_NODAYSLEEP_CAVE = "Too bored to sleep.",
	ANNOUNCE_NOHUNGERSLEEP = "My stomach is grumbling so damn hard I can't sleep. Great..",
	ANNOUNCE_NOSLEEPONFIRE = "Now why the hell would I sleep there?",
	ANNOUNCE_NODANGERSIESTA = "I'm not going to do that!",
	ANNOUNCE_NONIGHTSIESTA = "I'm not going to do that!",
	ANNOUNCE_NONIGHTSIESTA_CAVE = "This place is too messed up. I can't sleep here..",
	ANNOUNCE_NOHUNGERSIESTA = "No! I'm too hungry to do that!",
	ANNOUNCE_NODANGERAFK = "Wrong time to run!",
	ANNOUNCE_NO_TRAP = "Well, that was damn easy.",
	ANNOUNCE_PECKED = "Damn OW! Stop that!",
	ANNOUNCE_QUAKE = "Oh god what is happening?!",
	ANNOUNCE_RESEARCH = "Guess I got to do this then..",
	ANNOUNCE_SHELTER = "You trees aren't that bad I guess..",
	ANNOUNCE_THORNS = "Ouch! Damn!",
	ANNOUNCE_BURNT = "It burns! Oh god!",
	ANNOUNCE_TORCH_OUT = "Finally got rid of that damn fire.",
	ANNOUNCE_FAN_OUT = "There goes that fan..",
    ANNOUNCE_COMPASS_OUT = "It broke. Great..",
	ANNOUNCE_TRAP_WENT_OFF = "Great..",
	ANNOUNCE_UNIMPLEMENTED = "OW! I don't think it's ready yet..",
	ANNOUNCE_WORMHOLE = "Why the hell did I do that?",
	ANNOUNCE_CANFIX = "\nI'm pretty sure I can fix this..",
	ANNOUNCE_ACCOMPLISHMENT = "I feel god damn GREAT!",
	ANNOUNCE_ACCOMPLISHMENT_DONE = "Mission accomplished!",	
	ANNOUNCE_INSUFFICIENTFERTILIZER = "I guess that thing is still hungry..",
	ANNOUNCE_TOOL_SLIP = "Damn it! It's too slippery!",
	ANNOUNCE_LIGHTNING_DAMAGE_AVOIDED = "Oh dear god that was close!",

	ANNOUNCE_DAMP = "It's raining. Great..",
	ANNOUNCE_WET = "The water is giving me shivers..",
	ANNOUNCE_WETTER = "Way too much water for my tastes..",
	ANNOUNCE_SOAKED = "Am I melting?!",
	
	ANNOUNCE_BECOMEGHOST = "%&#£$#!!",
	ANNOUNCE_GHOSTDRAIN = "I can feel my soul being ripped apart..",

	DESCRIBE_SAMECHARACTER = "That's one surprisingly ugly snowman.",
	
	BATTLECRY =
	{
		GENERIC = "Die!",
		PIG = "Give me that damn bacon!",
		PREY = "I'm going to eat you alive!",
		SPIDER = "I hate pests like you!",
		SPIDER_WARRIOR = "Go to hell you damn pest!",
	},
	COMBAT_QUIT =
	{
		GENERIC = "That's done...",
		PIG = "I'm not that hungry after all..",
		PREY = "Not today.",
		SPIDER = "Forget it, you pest.",
		SPIDER_WARRIOR = "Not today.",
	},
	DESCRIBE =
	{

		BERNIE_INACTIVE =
		{
			BROKEN = "Damn great.",
			GENERIC = "It's all scorched..",
		},
		BERNIE_ACTIVE = "Holy crap. Did that thing move?",
		

        PLAYER =
        {
            GENERIC = "It's that idiot %s!",
            ATTACKER = "What the hell is %s doing?",
            MURDERER = "You bastard!",
            REVIVER = "%s, what a weird fellow..",
            GHOST = "%s shouldn't be around.",
        },
		WILSON = 
		{
			GENERIC = "It's Wilson!",
			ATTACKER = "That Wilson looks shifty...",
			MURDERER = "Murderer!",
			REVIVER = "Wilson, friend of ghosts.",
			GHOST = "Wilson could use a heart.",
		},
		WOLFGANG = 
		{
			GENERIC = "It's Wolfgang!",
			ATTACKER = "That Wolfgang looks shifty...",
			MURDERER = "Murderer!",
			REVIVER = "Wolfgang, friend of ghosts.",
			GHOST = "Wolfgang could use a heart.",
		},
		WAXWELL = 
		{
			GENERIC = "It's Maxwell!",
			ATTACKER = "That Maxwell looks shifty...",
			MURDERER = "Murderer!",
			REVIVER = "Maxwell, friend of ghosts.",
			GHOST = "Maxwell could use a heart.",
		},
		WX78 = 
		{
			GENERIC = "It's WX-78!",
			ATTACKER = "That WX-78 looks shifty...",
			MURDERER = "Murderer!",
			REVIVER = "WX-78, friend of ghosts.",
			GHOST = "WX-78 could use a heart.",
		},
		WILLOW = 
		{
			GENERIC = "It's Willow!",
			ATTACKER = "That Willow looks shifty...",
			MURDERER = "Murderer!",
			REVIVER = "Willow, friend of ghosts.",
			GHOST = "Willow could use a heart.",
		},
		WENDY = 
		{
			GENERIC = "It's Wendy!",
			ATTACKER = "That Wendy looks shifty...",
			MURDERER = "Murderer!",
			REVIVER = "Wendy, friend of ghosts.",
			GHOST = "Wendy could use a heart.",
		},
		WOODIE = 
		{
			GENERIC = "It's Woodie!",
			ATTACKER = "That Woodie looks shifty...",
			MURDERER = "Murderer!",
			REVIVER = "Woodie, friend of ghosts.",
			GHOST = "Woodie could use a heart.",
		},
		WICKERBOTTOM = 
		{
			GENERIC = "It's Wickerbottom!",
			ATTACKER = "That Wickerbottom looks shifty...",
			MURDERER = "Murderer!",
			REVIVER = "Wickerbottom, friend of ghosts.",
			GHOST = "Wickerbottom could use a heart.",
		},
		WES = 
		{
			GENERIC = "It's Wes!",
			ATTACKER = "That Wes looks shifty...",
			MURDERER = "Murderer!",
			REVIVER = "Wes, friend of ghosts.",
			GHOST = "Wes could use a heart.",
		},
		MULTIPLAYER_PORTAL = "I wonder what idiot built this..",
        MIGRATION_PORTAL = {
            GENERIC = "How does this work anyways?",
            OPEN = "Weird stuff.",
            FULL = "This isn't working. Great..",
        },
		GLOMMER = "That thing sure has a lot of noses..",
		GLOMMERFLOWER = 
		{
			GENERIC = "This doesn't look too bad..",
			DEAD = "Looks dead.",
		},
		GLOMMERWINGS = "Looks sick.",
		GLOMMERFUEL = "Smells like crap..",
		BELL = "RINGA-DAMN-DING!",
		STATUEGLOMMER = 
		{	
			GENERIC = "What the hell is that supposed to be?",
			EMPTY = "Destroyed it.",
		},

		WEBBERSKULL = "Shame. It wasn't that bad.",
		WORMLIGHT = "Looks delicious.",
		WORMLIGHT_LESSER = "Kind of wrinkled.",
		WORM =
		{
		    PLANT = "Seems safe to me.",
		    DIRT = "Just looks like a pile of crap..",
		    WORM = "Is that a worm!?",
		},
        WORMLIGHT_PLANT = "Seems safe to me.",
		MOLE =
		{
			HELD = "Nowhere left to dig, you pest..",
			UNDERGROUND = "Something is rumbling under there..",
			ABOVEGROUND = "I hate that little thing...",
		},
		MOLEHILL = "Looks dirty.",
		MOLEHAT = "Smells really damn bad.",

		EEL = "I can eat this I guess.",
		EEL_COOKED = "Smells pretty good!",
		UNAGI = "This is damn delicious!",
		EYETURRET = "I don't trust that.",
		EYETURRET_ITEM = "That thing is sleeping..",
		MINOTAURHORN = "Holy crap. That sure can leave a mark.",
		MINOTAURCHEST = "Probably has something horrible in it.",
		THULECITE_PIECES = "Some Thulecite chunks..",
		POND_ALGAE = "Some algae by a pond. Great.",
		GREENSTAFF = "This seems nice.",
		POTTEDFERN = "It's a potted fern. What a surprise.",

		THULECITE = "Weird stuff.",
		ARMORRUINS = "It's oddly light..",
		RUINS_BAT = "Not that heavy. Weird..",
		RUINSHAT = "I guess this works..",
		NIGHTMARE_TIMEPIECE =
		{
            CALM = "I feel normal..",
            WARN = "Something weird is happening.",
            WAXING = "Something strange is happening!!",
            STEADY = "It seems steady!",
            WANING = "It seems to be receding. Great..",
            DAWN = "Almost done with this..",
            NOMAGIC = "Nothing weird going on around here.",
		},
		BISHOP_NIGHTMARE = "It's going down!",
		ROOK_NIGHTMARE = "Oh dear god.",
		KNIGHT_NIGHTMARE = "What the hell is that!?",
		MINOTAUR = "Oh my god..",
		SPIDER_DROPPER = "Damn..",
		NIGHTMARELIGHT = "Weird light..",
		NIGHTSTICK = "Zap!",
		GREENGEM = "A gem I guess. Color of vomit.",
		RELIC = "Ancient stuff. Pretty boring.",
		RUINS_RUBBLE = "I guess this could be fixed.",
		MULTITOOL_AXE_PICKAXE = "Seems like this could do some stuff.",
		ORANGESTAFF = "Good stuff.",
		YELLOWAMULET = "Oh god this feels warm. Nope!",
		GREENAMULET = "Feels good.",
		SLURPERPELT = "It's dead.. Great.",	

		SLURPER = "Too much hair for my taste.",
		SLURPER_PELT = "It's dead.. Great.",
		ARMORSLURPER = "Uhh..",
		ORANGEAMULET = "Teleportation! Great..",
		YELLOWSTAFF = "Yup. Gem on a stick.",
		YELLOWGEM = "The color of piss.",
		ORANGEGEM = "The color of my nose. I hate it.",
		TELEBASE = 
		{
			VALID = "It's ready..",
			GEMS = "It needs more purple gems..",
		},
		GEMSOCKET = 
		{
			VALID = "Looks ready..",
			GEMS = "It needs a gem..",
		},
		STAFFLIGHT = "Seems damn dangerous!",
	
        ANCIENT_ALTAR = "Some old structure..",

        ANCIENT_ALTAR_BROKEN = "Broken stuff..",

        ANCIENT_STATUE = "Well that's terrifying..",

        LICHEN = "What the heck?",
		CUTLICHEN = "Nutritious I guess?",

		CAVE_BANANA = "It's edible I guess..",
		CAVE_BANANA_COOKED = "Ehh.. Not bad.",
		CAVE_BANANA_TREE = "A tree.",
		ROCKY = "Damn those claws!",
		
		COMPASS =
		{
			GENERIC="I'm getting dizzy.",
			N = "North..",
			S = "South..",
			E = "East..",
			W = "West..",
			NE = "Northeast..",
			SE = "Southeast..",
			NW = "Northwest..",
			SW = "Southwest..",
		},

		NIGHTMARE_TIMEPIECE =	-- Duplicated
		{
			WAXING = "I think it's becoming more concentrated!",
			STEADY = "It seems to be staying steady.",
			WANING = "Feels like it's receding.",
			DAWN = "The nightmare is almost gone!",
			WARN = "Getting pretty magical around here.",
			CALM = "All is well..",
			NOMAGIC = "There's no magic around here.",
		},

		HOUNDSTOOTH="I don't wanna touch that..",
		ARMORSNURTLESHELL="Looks like it could be worn..",
		BAT="Ack! God damn that's terrifying!",
		BATBAT = "Weird stuff..",
		BATWING="Disgusting..",
		BATWING_COOKED="At least it's not coming back..",
        BATCAVE = "Dear god no.",
		BEDROLL_FURRY="That's comfy.",
		BUNNYMAN="What the hell..",
		FLOWER_CAVE="Weird..",
		FLOWER_CAVE_DOUBLE="Weird..",
		FLOWER_CAVE_TRIPLE="Weird..",
		GUANO="That's not snow..",
		LANTERN="Get it away from me!",
		LIGHTBULB="I don't want that near me.",
		MANRABBIT_TAIL="This feel weird..",
		MUSHTREE_TALL = {
            GENERIC = "Doesn't look normal..",
            BLOOM = "Smells bad..",
        },
		MUSHTREE_MEDIUM = {
            GENERIC = "That's not normal..",
            BLOOM = "Smells bad..",
        },
		MUSHTREE_SMALL = {
            GENERIC = "Weird stuff..",
            BLOOM = "Smells bad..",
        },
        MUSHTREE_TALL_WEBBED = "Disgusting!",
        SPORE_TALL = "It's just drifting around..",
        SPORE_MEDIUM = "It's just drifting around..",
        SPORE_SMALL = "It's just drifting around..",
        SPORE_TALL_INV = "Good to have I guess..",
        SPORE_MEDIUM_INV = "Good to have I guess..",
        SPORE_SMALL_INV = "Good to have I guess..",
		RABBITHOUSE=
		{
			GENERIC = "Disgusting! Those aren't even real!",
			BURNT = "Disgusting! It's not even real!",
		},
		SLURTLE="I think I'm going to vomit..",
		SLURTLE_SHELLPIECES="It makes my head dizzy..",
		SLURTLEHAT="Weird hat..",
		SLURTLEHOLE="Ehh.. Let's not touch that..",
		SLURTLESLIME="I don't want to know what that is..",
		SNURTLE="Oh god what is that?",
		SPIDER_HIDER="Oh god! More pests!",
		SPIDER_SPITTER="I damn hate spiders!",
		SPIDERHOLE="Oh my god.",
		STALAGMITE="Looks like a rock to me..",
		STALAGMITE_FULL="Looks like a rock to me..",
		STALAGMITE_LOW="Looks like a rock to me..",
		STALAGMITE_MED="Looks like a rock to me..",
		STALAGMITE_TALL="More damn rocks..",
		STALAGMITE_TALL_FULL="More damn rocks..",
		STALAGMITE_TALL_LOW="More damn rocks..",
		STALAGMITE_TALL_MED="More damn rocks..",

		TURF_CARPETFLOOR = "It's ground. What a surprise..",
		TURF_CHECKERFLOOR = "It's ground. What a surprise..",
		TURF_DIRT = "It's ground. What a surprise..",
		TURF_FOREST = "It's ground. What a surprise..",
		TURF_GRASS = "It's ground. What a surprise..",
		TURF_MARSH = "It's ground. What a surprise..",
		TURF_ROAD = "It's ground. What a surprise..",
		TURF_ROCKY = "It's ground. What a surprise..",
		TURF_SAVANNA = "It's ground. What a surprise..",
		TURF_WOODFLOOR = "It's ground. What a surprise..",

		TURF_CAVE="It's ground. What a surprise..",
		TURF_FUNGUS="It's ground. What a surprise..",
		TURF_SINKHOLE="It's ground. What a surprise..",
		TURF_UNDERROCK="It's ground. What a surprise..",
		TURF_MUD="It's ground. What a surprise..",

		TURF_DECIDUOUS = "It's ground. What a surprise..",
		TURF_SANDY = "It's ground. What a surprise..",
		TURF_BADLANDS = "It's ground. What a surprise..",

		POWCAKE = "This looks like a rotten maggot.. Damn disgusting.",
        CAVE_ENTRANCE = "More chores? Great.",
        CAVE_ENTRANCE_RUINS = "It's probably hiding something that wants to kill me..",
        CAVE_ENTRANCE_OPEN = {
            GENERIC = "God damn!",
            OPEN = "What a god damn terrifying place..",
            FULL = "Nope. I'm not going there..",
        },
        CAVE_EXIT = {
            GENERIC = "A way out. Great..",
            OPEN = "I'm getting the hell out of this place!",
            FULL = "Oh god no! It's not working!",
        },
		MAXWELLPHONOGRAPH = "What the hell? It sounds.. Lovely!",
		BOOMERANG = "What is this? Some stick or something?",
		PIGGUARD = "What an ugly bastard.",
		ABIGAIL = "It's a ghost. Great.",
		ADVENTURE_PORTAL = "Portals? Great..",
		AMULET = "This gives me a slight headache..",
		ANIMAL_TRACK = "Tracks left by some stupid animal..",
		ARMORGRASS = "It feels itchy. Great..",
		ARMORMARBLE = "Carrying this is a chore and a half..",
		ARMORWOOD = "What a grotesque piece of armor..",
		ARMOR_SANITY = "I hate it.",
		ASH =
		{
			GENERIC = "Fire consumed another victim. Great..",
			REMAINS_GLOMMERFLOWER = "Fire has done it again! Damn it!",
			REMAINS_EYE_BONE = "Fire has done it again! God damn great!",
			REMAINS_THINGIE = "Fire consumed another victim. Great..",
		},
		AXE = "Sharp and dangerous. Just my style.",
		BABYBEEFALO = "A fat little fellow.",
		BACKPACK = "More junk to carry. Great..",
		BACONEGGS = "It's smiling at me. Piss off.",
		BANDAGE = "Seems sterile enough.",
		BASALT = "Too damn tough!",
		BATBAT = "It looks ugly.",	-- Duplicated
		BEARDHAIR = "Disgusting..",
		BEARGER = "Holy crap. That's one badger.. Or is it a bear?",
		BEARGERVEST = "It smells rancid..",
		ICEPACK = "Made of dead animals..",
		BEARGER_FUR = "Thick, disgusting fur.",
		BEDROLL_STRAW = "Very uncomfortable",
		BEE =
		{
			GENERIC = "Little pests always sting me.",
			HELD = "I should swat you right where you are..",
		},
		BEEBOX =
		{
			READY = "It's full of damn bees.",
			FULLHONEY = "I can smell the honey. I hate it.",
			GENERIC = "God damn bees!",
			NOHONEY = "Nope. It's empty..",
			SOMEHONEY = "It doesn't smell right.. Maybe I should wait..",
			BURNT = "Damn fire!",
		},
		BEEFALO =
		{
			FOLLOWER = "I'm watching you..",
			GENERIC = "Deadly and full of fur.",
			NAKED = "Not so tough now, are you?",
			SLEEPING = "I still don't trust them..",
		},
		BEEFALOHAT = "It has a distinct smell to it. I hate it..",
		BEEFALOWOOL = "It's mine now!",
		BEEHAT = "Not my style..",
		BEEHIVE = "The sound gives me nightmares..",
		BEEMINE = "I'll leave that bee.. He he..",
		BEEMINE_MAXWELL = "I'll leave that bee.. He he..",
		BERRIES = "They taste stingy, but not too bad..",
		BERRIES_COOKED = "The only thing fire is good for..",
		BERRYBUSH =
		{
			BARREN = "It's dead. Great..",
			WITHERED = "The heat is ruining things as usual.",
			GENERIC = "Some berries are growing there..",
			PICKED = "Nothing there. Great..",
		},
		BIGFOOT = "God damn terrifying.",
		BIRDCAGE =
		{
			GENERIC = "Reminds me of home.",
			OCCUPIED = "Not going anywhere, are you?",
			SLEEPING = "It's passed out.",
			HUNGRY = "It wants something to eat. Great..",
			STARVING = "I can hear it's stomach rumbling.. ",
			DEAD = "Good for nothing but a stew.",
			SKELETON = "Oops.",
		},
		BIRDTRAP = "Time to catch some food!",
		BIRD_EGG = "Looks tasty.",
		BIRD_EGG_COOKED = "It smells weird..",
		BISHOP = "What the hell!?",
		BLOWDART_FIRE = "Share the pain!",
		BLOWDART_SLEEP = "These could come in handy..",
		BLOWDART_PIPE = "Not the most efficient weapon..",
		BLUEAMULET = "Feels real good!",
		BLUEGEM = "There's one like this inside me..",
		BLUEPRINT = "Confusing scribbles..",
		BELL_BLUEPRINT = "Confusing scribbles..",
		BLUE_CAP = "Makes me feel weird..",
		BLUE_CAP_COOKED = "Smells worse now..",
		BLUE_MUSHROOM =
		{
			GENERIC = "Doesn't look edible..",
			INGROUND = "It's hiding. Great..",
			PICKED = "It's gone. Great.",
		},
		BOARDS = "Boards. What a surprise..",
		BOAT = "A rickety boat..",
		BONESHARD = "Bones of my enemies.",
		BONESTEW = "I eat these to become stronger!",
		BUGNET = "This is a bad weapon..",
		BUSHHAT = "It feels very itchy. Great..",
		BUTTER = "It's already melting. Great..",
		BUTTERFLY =
		{
			GENERIC = "Fragile little thing.",
			HELD = "You're mine now!",
		},
		BUTTERFLYMUFFIN = "A disgusting treat.",
		BUTTERFLYWINGS = "They break off so easily.",
		BUZZARD = "That's one ugly bird.",
		CACTUS = 
		{
			GENERIC = "It hurts to touch it. Great..",
			PICKED = "It looks different..",
		},
		CACTUS_MEAT_COOKED = "Less painful now..",
		CACTUS_MEAT = "I'm not sure if this is edible..",
		CACTUS_FLOWER = "As stingy as it might be, I still hate it.",

		COLDFIRE =
		{
			EMBERS = "It's almost gone. Great..",
			GENERIC = "Cold goodness..",
			HIGH = "The bigger the better!",
			LOW = "It's slowly dying..",
			NORMAL = "Cold goodness..",
			OUT = "Damn it. It's gone..",
		},
		CAMPFIRE =
		{
			EMBERS = "Die already!",
			GENERIC = "It hurts my insides..",
			HIGH = "It's getting out of control! Oh my god!",
			LOW = "It's dying! Finally!",
			NORMAL = "It hurts my insides..",
			OUT = "Thank god it's over.",
		},
		CANE = "Feels strangely familiar..",
		CATCOON = "Annoying little bastard..",
		CATCOONDEN = 
		{
			GENERIC = "Something lives in there..",
			EMPTY = "It only smells of death now..",
		},
		CATCOONHAT = "Not my style..",
		COONTAIL = "Tail of a dead animal..",
		CARROT = "Looks familiar..",
		CARROT_COOKED = "I'm not sure how I should feel about this..",
		CARROT_PLANTED = "Something is growing.",
		CARROT_SEEDS = "It's a seed..",
		WATERMELON_SEEDS = "It's a seed..",
		CAVE_FERN = "It's a fern. Great..",
		CHARCOAL = "What the hell is this stuff?",
        CHESSJUNK1 = "Broken stuff..",
        CHESSJUNK2 = "More broken stuff..",
        CHESSJUNK3 = "Even more broken stuff..",
		CHESTER = "He's not too bad.",
		CHESTER_EYEBONE =
		{
			GENERIC = "I don't like the way it's looking at me..",
			WAITING = "Seems to be dead.",
		},
		COOKEDMANDRAKE = "It's dead now.",
		COOKEDMEAT = "Now this is the good stuff!",
		COOKEDMONSTERMEAT = "Still tastes horrible..",
		COOKEDSMALLMEAT = "It's decent..",
		COOKPOT =
		{
			COOKING_LONG = "What's taking so long!?",
			COOKING_SHORT = "Why isn't it done yet!?",
			DONE = "Finally!",
			EMPTY = "It's empty. Great..",
			BURNT = "Nooooooooooo!!",
		},
		CORN = "Not my favourite..",
		CORN_COOKED = "Still not that great..",
		CORN_SEEDS = "It's a seed..",
		CROW =
		{
			GENERIC = "The bringer of death, they say..",
			HELD = "Now what should I do with you?",
		},
		CUTGRASS = "What a surprise, it's grass, but cut!",
		CUTREEDS = "What a surprise, it's reeds, but cut!",
		CUTSTONE = "I'm not sure how I was able to make these..",
		DEADLYFEAST = "It's edible, at least..",
		DEERCLOPS = "Holy crap!",
		DEERCLOPS_EYEBALL = "God damn disgusting.. It's still moving..",
		EYEBRELLAHAT =	"It's pretty damn ugly.",
		DEPLETED_GRASS =
		{
			GENERIC = "A tuft of grass..",
		},
		DEVTOOL = "It smells of bacon!",
		DEVTOOL_NODEV = "I'm not strong enough to wield it.",
		DIRTPILE = "It's a pile of dirt... or IS it?",
		DIVININGROD =
		{
			COLD = "It's completely silent..",
			GENERIC = "What the hell is this then?",
			HOT = "It's going damn crazy!",
			WARM = "It's shaking like mad!",
			WARMER = "It's starting to shake a bit.",
		},
		DIVININGRODBASE =
		{
			GENERIC = "Now what's this then?",
			READY = "Seems to have a keyhole or something..",
			UNLOCKED = "Great, something happened..",
		},
		DIVININGRODSTART = "I could probably use that..",
		DRAGONFLY = "Whoa! What the hell is that?!",
		ARMORDRAGONFLY = "Oh god it burns!",
		DRAGON_SCALES = "They hurt to touch..",
		DRAGONFLYCHEST = "Sturdy, but painful to the touch..",
		LAVASPIT = 
		{
			HOT = "Oh god, it burns!",
			COOL = "I don't trust that..",
		},

		LAVAE = "Get it away from me!",
		LAVAE_PET = 
		{
			STARVING = "Why is it looking at me like that?!",
			HUNGRY = "It definitely wants to eat me!",
			CONTENT = "It seems too happy..",
			GENERIC = "I don't trust that thing..",
		},
		LAVAE_EGG = 
		{
			GENERIC = "Nope, not touching that..",
		},
		LAVAE_EGG_CRACKED =
		{
			COLD = "Good, it's not that warm.",
			COMFY = "What the hell?",
		},
		LAVAE_TOOTH = "Ugh..",

		DRAGONFRUIT = "Looks like an organ or something..",
		DRAGONFRUIT_COOKED = "Cooked organs, then?",
		DRAGONFRUIT_SEEDS = "It's a seed..",
		DRAGONPIE = "It smells really weird..",
		DRUMSTICK = "This is how you get salmonella..",
		DRUMSTICK_COOKED = "Has a decent taste..",
		DUG_BERRYBUSH = "I could probably plant this..",
		DUG_GRASS = "I could probably plant this..",
		DUG_MARSH_BUSH = "I should plant this..",
		DUG_SAPLING = "I should plant this..",
		DURIAN = "Oh dear god. This smells so damn bad..",
		DURIAN_COOKED = "I'm going to god damn vomit from this smell!",
		DURIAN_SEEDS = "Even the seeds smell..",
		EARMUFFSHAT = "Not my style.. I prefer the cold.",
		EGGPLANT = "Ehh.. What is this?",
		EGGPLANT_COOKED = "Doesn't taste as bad as I thought.",
		EGGPLANT_SEEDS = "It's a seed..",
		DECIDUOUSTREE = 
		{
			BURNING = "Damn fire..",
			BURNT = "Damn fire.. Always killing things.",
			CHOPPED = "I'm sorry for this!",
			POISON = "Holy crap! Nature sure is damn scary!",
			GENERIC = "Good ol' tree..",
		},
		ACORN = "I stole this from the tree.",
        ACORN_SAPLING = "It's growing..",
		ACORN_COOKED = "I shouldn't be eating these..",
		BIRCHNUTDRAKE = "What the hell is that?",
		EVERGREEN =
		{
			BURNING = "Damn fire..",
			BURNT = "Damn fire.. Always killing things.",
			CHOPPED = "I'm sorry for this!",
			GENERIC = "Good ol' tree..",
		},
		EVERGREEN_SPARSE =
		{
			BURNING = "Damn fire..",
			BURNT = "Damn fire.. Always killing things.",
			CHOPPED = "I'm sorry for this!",
			GENERIC = "Looks majestic..",
		},
		EYEPLANT = "Stop looking at me.",
		FARMPLOT =
		{
			GENERIC = "I guess I could plant something here..",
			GROWING = "Hurry the hell up!",
			NEEDSFERTILIZER = "It needs some fertilizer I guess. Damn great..",
			BURNT = "Damn fire.. Always killing things.",
		},
		FEATHERHAT = "This is definitely not my style..",
		FEATHER_CROW = "A dark feather..",
		FEATHER_ROBIN = "A red feather..",
		FEATHER_ROBIN_WINTER = "A snowbird feather..",
		FEM_PUPPET = "She's trapped!",
		FIREFLIES =
		{
			GENERIC = "That glow can't be natural..",
			HELD = "I'm not sure about this glow...",
		},
		FIREHOUND = "Oh god! Straight out of my nightmares!",
		FIREPIT =
		{
			EMBERS = "Die already!",
			GENERIC = "It hurts my insides..",
			HIGH = "It's getting out of control! Oh my god!",
			LOW = "It's dying! Finally!",
			NORMAL = "It hurts my insides..",
			OUT = "Thank god it's over.",
		},
		COLDFIREPIT =
		{
			EMBERS = "It's almost gone. Great..",
			GENERIC = "Cold goodness..",
			HIGH = "The bigger the better!",
			LOW = "It's slowly dying..",
			NORMAL = "Cold goodness..",
			OUT = "Damn it! It's gone.",
		},
		FIRESTAFF = "Now why the hell would I use this?",
		FIRESUPPRESSOR = 
		{	
			ON = "Murder that fire!",
			OFF = "Guess you can rest for a bit.",
			LOWFUEL = "Not much fuel left. Great..",
		},

		FISH = "Now don't try to slip away!",
		FISHINGROD = "Not my weapon of choice..",
		FISHSTICKS = "Very bland taste..",
		FISHTACOS = "Odio esta mierda..",
		FISH_COOKED = "Grilled, but full of fishbones.",
		FLINT = "Could come in handy..",
		FLOWER = "I don't like flowers..",
        FLOWER_WITHERED = "It's dead..",
		FLOWERHAT = "Ugh.. What a pretentious style..",
		FLOWER_EVIL = "I prefer these flowers..",
		FOLIAGE = "Some weird leaves..",
		FOOTBALLHAT = "I don't like sports..",
		FROG =
		{
			DEAD = "Kill or be killed..",
			GENERIC = "An ugly bastard..",
			SLEEPING = "It's passed out..",
		},
		FROGGLEBUNWICH = "Not very good..",
		FROGLEGS = "They are still twitching..",
		FROGLEGS_COOKED = "Cooked, but still very slimy..",
		FRUITMEDLEY = "Kind of refreshing..",
		FURTUFT = "Some smelly fur..", 
		GEARS = "Cold to the touch.",
		GHOST = "I feel shivers all over.. God damn ghosts..",
		GOLDENAXE = "Heeere's Snowy!",
		GOLDENPICKAXE = "Too fancy for my tastes..",
		GOLDENPITCHFORK = "What a waste of gold..",
		GOLDENSHOVEL = "I can bury something with this.. Now with extra bling..",
		GOLDNUGGET = "Looks real..",
		GRASS =
		{
			BARREN = "Not much growing here..",
			WITHERED = "It's way too hot for anything to live.. ",
			BURNING = "Agh! Another victim of fire!",
			GENERIC = "It's a tuft of grass..",
			PICKED = "Ripped apart..",
		},
		GREEN_CAP = "Something very strange about the taste..",
		GREEN_CAP_COOKED = "Still very strange..",
		GREEN_MUSHROOM =
		{
			GENERIC = "It's glowing faintly.. Doesn't seem edible..",
			INGROUND = "Are they sentient?",
			PICKED = "Nope. Nothing there..",
		},
		GUNPOWDER = "Snorting this is a bad idea..",
		HAMBAT = "Now this is just ridiculous.. It's not even sharp!",
		HAMMER = "I feel like hitting something..",
		HEALINGSALVE = "It hurts more than it helps..",
		HEATROCK =
		{
			FROZEN = "It's colder than ice. Just how I like it.",
			COLD = "That's a cold stone.. Lovely.",
			GENERIC = "It seems to change it's temperature easily..",
			WARM = "Agh! Not a pleasant feeling!",
			HOT = "Ouch! It's starting to burn my hands!",
		},
		HOME = "Someone must live here..",
		HOMESIGN =
		{
			GENERIC = "Home sweet home, I guess..",
            UNWRITTEN = "It's empty. Great..",
			BURNT = "Another thing ruined by fire..",
		},
		ARROWSIGN_POST =
		{
			GENERIC = "I'm not following this advice..",
            UNWRITTEN = "It's empty. Great..",
			BURNT = "Another thing ruined by fire..",
		},
		ARROWSIGN_PANEL =
		{
			GENERIC = "I'm not following this advice..",
            UNWRITTEN = "It's empty. Great..",
			BURNT = "Another thing ruined by fire..",
		},
		HONEY = "Too sticky for my tastes..",
		HONEYCOMB = "I stole this from the bees. Serves them right..",
		HONEYHAM = "Not bad..",
		HONEYNUGGETS = "They have a spicy taste..",
		HORN = "It's humming strangely..",
		HOUND = "Piss off, you damn hound!",
		HOUNDBONE = "Wasn't me.",
		HOUNDMOUND = "Smells like a dirty animal..",
		ICEBOX = "I wish I could fit in there..",
		ICEHAT = "Ahh..",
		ICEHOUND = "Clearly the alpha male..",
		INSANITYROCK =
		{
			ACTIVE = "I'm not your buddy, pal..",
			INACTIVE = "What is this supposed to be?",
		},
		JAMMYPRESERVES = "Is this blood? Great..",
		KABOBS = "Delicious AND dangerous? ",
		KILLERBEE =
		{
			GENERIC = "Damned demon spawns!",
			HELD = "I shouldn't be holding these damn things..",
		},
		KNIGHT = "What a horrible apparition..",
		KOALEFANT_SUMMER = "My next meal?",
		KOALEFANT_WINTER = "My next meal?",
		KRAMPUS = "Hey! Who the hell let you come here?!",
		KRAMPUS_SACK = "I don't want to know where this has been..",
		LEIF = "Chill, big guy!",
		LEIF_SPARSE = "Chill, big guy!",
		LIGHTNING_ROD =
		{
			CHARGED = "I HAVE THE POWER!",
			GENERIC = "Now this is a powerful weapon..",
		},
		LIGHTNINGGOAT = 
		{
			GENERIC = "Piss off..",
			CHARGED = "How the hell did it do that!?",
		},
		LIGHTNINGGOATHORN = "It's pulsing with energy.",
		GOATMILK = "What the hell.. Why would I drink this?",
		LITTLE_WALRUS = "What an ugly creature..",
		LIVINGLOG = "I'm getting bad vibes from this.. Why are my limbs shaking?",
		LOG =
		{
			BURNING = "Noo!",
			GENERIC = "Good ol' sturdy piece of wood.",
		},
		LUREPLANT = "These plants are really strange..",
		LUREPLANTBULB = "Eugh..",
		MALE_PUPPET = "He's trapped!",

		MANDRAKE_ACTIVE = "Piss off!",
		MANDRAKE_PLANTED = "Does this plant have a face?",
		MANDRAKE = "Has a spicy smell..",

		MANDRAKESOUP = "Tastes like chicken..",
		MANDRAKE_COOKED = "I can still hear it screaming..",
		MARBLE = "Too shiny to my liking..",
		MARBLEPILLAR = "Very sturdy..",
		MARBLETREE = "It looks very strong..",
		MARSH_BUSH =
		{
			BURNING = "Another one bites the dust..",
			GENERIC = "It looks thorny..",
			PICKED = "Ouch! Damn it!",
		},
		BURNT_MARSH_BUSH = "It's all burnt up..",
		MARSH_PLANT = "It's a plant. What a surprise..",
		MARSH_TREE =
		{
			BURNING = "Nooo! What a waste of good spikes!",
			BURNT = "Now that's one dead tree..",
			CHOPPED = "Meet your maker!",
			GENERIC = "I wouldn't touch that..",
		},
		MAXWELL = "I hate that guy..",
		MAXWELLHEAD = "I can see into his pores. Damn disgusting..",
		MAXWELLLIGHT = "Some weird magic..",
		MAXWELLLOCK = "How the hell does this work?",
		MAXWELLTHRONE = "That chair seems to be pulsing with dark power..",
		MEAT = "It's really bloody. Great..",
		MEATBALLS = "Very spicy..",
		MEATRACK =
		{
			DONE = "I guess it's done..",
			DRYING = "Sigh.. Not done yet..",
			DRYINGINRAIN = "Damn this rain!",
			GENERIC = "I could dry some meat here..",
			BURNT = "Well damn it..",
		},
		MEAT_DRIED = "Tough to eat..",
		MERM = "God damn weird creatures..!",
		MERMHEAD = 
		{
			GENERIC = "That thing smells rotten..",
			BURNT = "Now it smells even damn worse..",
		},
		MERMHOUSE = 
		{
			GENERIC = "What a horrible house..",
			BURNT = "Guess it burned.. Not a big loss..",
		},
		MINERHAT = "Seems pretty useful..",
		MONKEY = "Seems to be really stupid..",
		MONKEYBARREL = "Did that just move?",
		MONSTERLASAGNA = "Still has a horrible taste..",
		FLOWERSALAD = "Has a very fresh taste..",
        ICECREAM = "Now this is some good stuff!",
        WATERMELONICLE = "This is actually pretty good..",
        TRAILMIX = "Tasteless..",
        HOTCHILI = "Oh dear god! It's like eating lava!",
        GUACAMOLE = "Well this sure doesn't look appetizing..",
		MONSTERMEAT = "Dear god.. It smells like death..",
		MONSTERMEAT_DRIED = "I still wouldn't eat that..",
		MOOSE = "I'm not sure how I should feel about that thing..",
		MOOSEEGG = "What in the living hell..?",
		MOSSLING = "What a freak of nature!",
		FEATHERFAN = "I guess this does it's job decently..",
        MINIFAN = "Makes this world a bit more easier to tolerate..",
		GOOSE_FEATHER = "Fur.. In feather form? What the hell?",
		STAFF_TORNADO = "A weapon of mass destruction!",
		MOSQUITO =
		{
			GENERIC = "I god damn hate those little things..",
			HELD = "What a disgusting thing..",
		},
		MOSQUITOSACK = "God damn disgusting..",
		MOUND =
		{
			DUG = "A good day's work!",
			GENERIC = "A strange sight..",
		},
		NIGHTLIGHT = "It gives off a calming light..",
		NIGHTMAREFUEL = "What the hell is this stuff then?",
		NIGHTSWORD = "I guess dreams can come true after all..",
		NITRE = "Smells strange..",
		ONEMANBAND = "It gives off a damn annoying tune..",
		PANDORASCHEST = "I have a bad feeling about this..",
		PANFLUTE = "I hate flutes..",
		PAPYRUS = "I've always wanted to write stuff down.. NOT!",
		PENGUIN = "What an annoying bird..",
		PERD = "Get the hell away from those berries!",
		PEROGIES = "Ehh..",
		PETALS = "The remains of a flower..",
		PETALS_EVIL = "I can almost feel them pulsing with evil..",
		PHLEGM = "Damn disgusting. Why the hell would I eat this?",
		PICKAXE = "Good for hitting things with..",
		PIGGYBACK = "What a lovely backpack..",
		PIGHEAD = 
		{	
			GENERIC = "Seems like somebody made some enemies..",
			BURNT = "What a waste of materials..",
		},
		PIGHOUSE =
		{
			FULL = "Who's in there!?",
			GENERIC = "Who needs a house anyway..",
			LIGHTSOUT = "Open the god damn door!",
			BURNT = "Serves you right..",
		},
		PIGKING = "How the hell does it survive?",
		PIGMAN =
		{
			DEAD = "Death! Murder! Agony!",
			FOLLOWER = "Get lost, will you?",
			GENERIC = "They are very disturbing..",
			GUARD = "What are you looking at?",
			WEREPIG = "Oh crap!",
		},
		PIGSKIN = "Stretchy.",
		PIGTENT = "Smells horrid..",
		PIGTORCH = "Uhh..",
		PINECONE = "It's a pinecone. What a surprise..",
        PINECONE_SAPLING = "Nothing interesting about a tree growing..",
        LUMPY_SAPLING = "Smells piney..",
		PITCHFORK = "Feels.. Natural.",
		PLANTMEAT = "Looks pretty disgusting..",
		PLANTMEAT_COOKED = "Still pretty bad..",
		PLANT_NORMAL =
		{
			GENERIC = "A plant. What a surprise..",
			GROWING = "Couldn't care less about a plant growing..",
			READY = "Seems like it has grown. Great..",
			WITHERED = "Damn great..",
		},
		POMEGRANATE = "Ehh..",
		POMEGRANATE_COOKED = "Looks like mushed brain..",
		POMEGRANATE_SEEDS = "It's a seed..",
		POND = "Murky and probably full of bugs..",
		POOP = "It's literally crap.",
		FERTILIZER = "A bucket full of crap..",
		PUMPKIN = "Reminds me of my past..",
		PUMPKINCOOKIE = "Crunchy..",
		PUMPKIN_COOKED = "A familiar taste..",
		PUMPKIN_LANTERN = "He looks familiar..",
		PUMPKIN_SEEDS = "It's a seed..",
		PURPLEAMULET = "It's whispering evil curses..",
		PURPLEGEM = "It has a strange glow to it..",
		RABBIT =
		{
			GENERIC = "Keep your paws off the merchandise..",
			HELD = "Don't move an inch..",
		},
		RABBITHOLE = 
		{
			GENERIC = "Some hole..",
			SPRING = "Serves them right..",
		},
		RAINOMETER = 
		{	
			GENERIC = "Seems useless..",
			BURNT = "Well damn it..",
		},
		RAINCOAT = "An ugly style..",
		RAINHAT = "What an ugly design..",
		RATATOUILLE = "Does it have rat meat in it?",
		RAZOR = "A puny weapon..",
		REDGEM = "Eugh.. Too warm..",
		RED_CAP = "The smell gives me a headache..",
		RED_CAP_COOKED = "Smells like old medicine..",
		RED_MUSHROOM =
		{
			GENERIC = "Doesn't look edible..",
			INGROUND = "How can they do that?",
			PICKED = "Nope. Nothing there..",
		},
		REEDS =
		{
			BURNING = "Damn fire!",
			GENERIC = "Reeds. What a surprise..",
			PICKED = "Nothing left..",
		},
        RELIC = 
        {
            GENERIC = "Some old stuff..",
            BROKEN = "Broken old stuff..",
        },
        RUINS_RUBBLE = "I guess this could be fixed..",
        RUBBLE = "Just some rocks..",
		RESEARCHLAB = 
		{	
			GENERIC = "A machine for doing.. stuff..",
			BURNT = "Damn it..",
		},
		RESEARCHLAB2 = 
		{
			GENERIC = "Kind of intimidating..",
			BURNT = "Well great..",
		},
		RESEARCHLAB3 = 
		{
			GENERIC = "Probably not safe to be near..",
			BURNT = "God damn it..",
		},
		RESEARCHLAB4 = 
		{
			GENERIC = "Weird stuff..",
			BURNT = "Well damn..",
		},
		RESURRECTIONSTATUE = 
		{
			GENERIC = "Some voodoo magic crap..",
			BURNT = "Fire consumes yet another victim..",
		},		RESURRECTIONSTONE = "Some strange stone..",
		ROBIN =
		{
			GENERIC = "Some bird..",
			HELD = "Stop struggling.",
		},
		ROBIN_WINTER =
		{
			GENERIC = "It seems to be doing well in this weather..",
			HELD = "Kind of fluffy..",
		},
		ROBOT_PUPPET = "It's trapped!",
		ROCK_LIGHT =
		{
			GENERIC = "A rock or something..",
			OUT = "Looks fragile..",
			LOW = "Not going near that!",
			NORMAL = "Uhh..",
		},
		ROCK = "A rock. What a surprise..",
		ROCK_ICE = 
		{
			GENERIC = "Rockin' it.",
			MELTED = "Damn it..",
		},
		ROCK_ICE_MELTED = "Damn it..",
		ICE = "Cold as my heart.",
		ROCKS = "Rocks. What a surprise..",
        ROOK = "Holy crap!",
		ROPE = "Ehh. It's some rope..",
		ROTTENEGG = "Dear lord, it smells horrid!",
		SANITYROCK =
		{
			ACTIVE = "I'm not your friend, buddy..",
			INACTIVE = "What is this supposed to be?",
		},
		SAPLING =
		{
			BURNING = "Nooo!",
			WITHERED = "Great..",
			GENERIC = "Grow, before I change my mind..",
			PICKED = "Ehh..",
		},
		SEEDS = "Some seeds..",
		SEEDS_COOKED = "They're dead now..",
		SEWING_KIT = "An assassination kit?",
		SHOVEL = "I got some work to do..",
		SILK = "Sticky and unpleasant..",
		SKELETON = "I guess things didn't go according to plan..",
		SCORCHED_SKELETON = "Burned to the crisp..",
		SKULLCHEST = "Looks terrible.",
		SMALLBIRD =
		{
			GENERIC = "A strange bird..",
			HUNGRY = "Now don't look at me like that..",
			STARVING = "I can hear it's stomach rumbling..",
		},
		SMALLMEAT = "Fresh meat..",
		SMALLMEAT_DRIED = "Tough to eat..",
		SPAT = "What the hell is that..",
		SPEAR = "Now this is a proper weapon!",
		SPIDER =
		{
			DEAD = "Eugh..",
			GENERIC = "I hate spiders..",
			SLEEPING = "Damn creepy crawlers..",
		},
		SPIDERDEN = "NOPE.",
		SPIDEREGGSACK = "Oh dear god, no!",
		SPIDERGLAND = "This doesn't seem safe at all!",
		SPIDERHAT = "It's way too itchy..",
		SPIDERQUEEN = "What the hell!?",
		SPIDER_WARRIOR =
		{
			DEAD = "Damn..",
			GENERIC = "Piss off!",
			SLEEPING = "Damn creepy crawlers..",
		},
		SPOILED_FOOD = "Disgusting..",
		STATUEHARP = "Some stupid statue..",
		STATUEMAXWELL = "He has some style..",
		STEELWOOL = "A bit too rough even for my taste..",
		STINGER = "Better be careful with that..",
		STRAWHAT = "What a boring hat..",
		STUFFEDEGGPLANT = "Doesn't really taste like anything at all..",
		SUNKBOAT = "Not much use to me now..",
		SWEATERVEST = "Way too fancy..",
		REFLECTIVEVEST = "It's got the right idea..",
		HAWAIIANSHIRT = "I hate it..",
		TAFFY = "I ate too many of these back in the day..",
		TALLBIRD = "A freak of nature!",
		TALLBIRDEGG = "A strange egg..",
		TALLBIRDEGG_COOKED = "Not bad..",
		TALLBIRDEGG_CRACKED =
		{
			COLD = "Perfect temperature.. Right?",
			GENERIC = "Is it cracking open?",
			HOT = "It's boiling!",
			LONG = "Doesn't seem to be doing much. Great..",
			SHORT = "Seems to be moving a little..",
		},
		TALLBIRDNEST =
		{
			GENERIC = "Now that's one strange egg..",
			PICKED = "A dirty old nest..",
		},
		TEENBIRD =
		{
			GENERIC = "It annoys me for some reason..",
			HUNGRY = "Hungry? Great..",
			STARVING = "Stop looking at me like that.",
		},
		TELEBASE =	-- Duplicated
		{
			VALID = "Seems ready..",
			GEMS = "Might need some gems or something..",
		},
		GEMSOCKET = -- Duplicated
		{
			VALID = "Seems ready..",
			GEMS = "Might need a gem..",
		},
		TELEPORTATO_BASE =
		{
			ACTIVE = "Not sure if I should be messing with this stuff..",
			GENERIC = "Seems dangerous..",
			LOCKED = "It's not working..",
			PARTIAL = "Doesn't seem to be working yet..",
		},
		TELEPORTATO_BOX = "Seems harmless enough..",
		TELEPORTATO_CRANK = "What the hell is this?",
		TELEPORTATO_POTATO = "It seems to be alive..",
		TELEPORTATO_RING = "Some ugly ring..",
		TELESTAFF = "Some crazy magic stuff..",
		TENT = 
		{
			GENERIC = "Finally some rest..",
			BURNT = "Damn!",
		},
		SIESTAHUT = 
		{
			GENERIC = "A nice resting place I guess..",
			BURNT = "Well damn..",
		},
		TENTACLE = "What the hell is that thing?!",
		TENTACLESPIKE = "Not a bad weapon..",
		TENTACLESPOTS = "Damn disgusting..",
		TENTACLE_PILLAR = "Something big is underneath..",
        TENTACLE_PILLAR_HOLE = "Nope..",
		TENTACLE_PILLAR_ARM = "What is that thing?",
		TENTACLE_GARDEN = "Damn..",
		TOPHAT = "It's pretty nice actually..",
		TORCH = "I guess the heat is manageable..",
		TRANSISTOR = "Meh..",
		TRAP = "Dangerously woven..",
		TRAP_TEETH = "Going to be a fun surprise for somebody...",
		TRAP_TEETH_MAXWELL = "Going to be a fun surprise for somebody..",
		TREASURECHEST = 
		{
			GENERIC = "Some box..",
			BURNT = "There goes that..",
		},
		TREASURECHEST_TRAP = "How convenient..",
		TREECLUMP = "Looks fake..",
		
		TRINKET_1 = "Are these glass eyes?", --Melty Marbles
		TRINKET_2 = "It doesn't even work..", --Fake Kazoo
		TRINKET_3 = "This knot infuriates me..", --Gord's Knot
		TRINKET_4 = "What the hell are you looking at?", --Gnome
		TRINKET_5 = "A plastic rocketship. Great..", --Tiny Rocketship
		TRINKET_6 = "Useless now. Great..", --Frazzled Wires
		TRINKET_7 = "Looks like a wooden flail. A crap one at that..", --Ball and Cup
		TRINKET_8 = "Some kind of a plug..", --Hardened Rubber Bung
		TRINKET_9 = "Are these.. Eyes!?", --Mismatched Buttons
		TRINKET_10 = "Snappy..", --Second-hand Dentures
		TRINKET_11 = "Don't make me smash you..", --Lying Robot
		TRINKET_12 = "Disgusting..", --Dessicated Tentacle
		TRINKET_13 = "A statue of a miniature human.. ", --Gnomette
		TRINKET_14 = "Not my cup of tea.. He he..", -- Leaky Teacup
		TRINKET_15 = "No salt seems to be coming out..", -- White Bishop
		TRINKET_16 = "This pepper shaker is broken..", -- Black Bishop
		TRINKET_17 = "That's the ugliest fork I've ever seen..", -- Bent Spork
		TRINKET_18 = "Seems like a scam..", -- Toy Trojan Horse
		TRINKET_19 = "Makes me kind of dizzy..", -- Unbalanced Top
		TRINKET_20 = "A spare hand!", -- Back Scratcher
		TRINKET_21 = "Is this some kind of a torture device?", -- Beaten Beater
		TRINKET_22 = "Some yarn. Great..", -- Frayed Yarn
		TRINKET_23 = "Is this a plastic knife or something?", -- Shoe Horn
		TRINKET_24 = "I hope this isn't an urn..", -- Lucky Cat Jar
		TRINKET_25 = "It's giving me breathing problems..", -- Air Unfreshener
		TRINKET_26 = "It's rotten..", -- Potato Cup
		TRINKET_27 = "What a waste of a good wire..", -- Wire Hanger
		
		TRUNKVEST_SUMMER = "Feels too soft..",
		TRUNKVEST_WINTER = "Why would I need this?",
		TRUNK_COOKED = "It's like eating rubber..",
		TRUNK_SUMMER = "Disgusting..",
		TRUNK_WINTER = "Disgusting..",
		TUMBLEWEED = "Could be anything in there..",
		TURF_CARPETFLOOR = "It's scratchy..",	-- Duplicated
		TURF_CHECKERFLOOR = "Ehh..",	-- Duplicated
		TURF_DIRT = "A chunk of ground..",	-- Duplicated
		TURF_FOREST = "A chunk of ground..",	-- Duplicated
		TURF_GRASS = "A chunk of ground..",	-- Duplicated
		TURF_MARSH = "A chunk of ground..",	-- Duplicated
		TURF_ROAD = "Some stone..",	-- Duplicated
		TURF_ROCKY = "A chunk of ground..",	-- Duplicated
		TURF_SAVANNA = "A chunk of ground..",	-- Duplicated
		TURF_WOODFLOOR = "These are floorboards. What a surprise..",	-- Duplicated
		TURKEYDINNER = "Toasty. I hate it..",
		TWIGS = "Sticks and stuff..",
		UMBRELLA = "Made out of skin. Great..",
		GRASS_UMBRELLA = "Too colorful..",
		UNIMPLEMENTED = "Damn! This shouldn't be here!",
		WAFFLES = "Too damn sweet..",
		WALL_HAY = 
		{	
			GENERIC = "Not very durable..",
			BURNT = "Well damn..",
		},
		WALL_HAY_ITEM = "This doesn't really work that well..",
		WALL_STONE = "Tough stone..",
		WALL_STONE_ITEM = "Very durable..",
		WALL_RUINS = "Looks old..",
		WALL_RUINS_ITEM = "It's all dusty..",
		WALL_WOOD = 
		{
			GENERIC = "Good for defending purposes..",
			BURNT = "Damn fantastic..",
		},
		WALL_WOOD_ITEM = "Pointy..",
		WALL_MOONROCK = "Quite smooth..",
		WALL_MOONROCK_ITEM = "This stuff is weird..",
		WALRUS = "Those horns must be good weapons..",
		WALRUSHAT = "That's one ugly hat..",
		WALRUS_CAMP =
		{
			EMPTY = "An old camping ground.. Hunters maybe?",
			GENERIC = "Who's house is this?!",
		},
		WALRUS_TUSK = "A sharp tusk.. ",
		WARDROBE = 
		{
			GENERIC = "A good way to store those ugly clothes..",
            BURNING = "Well there goes that..",
			BURNT = "Damn it..",
		},
		WARG = "God damn! That's a big hound!",
		WASPHIVE = "Nope..",
		WATERMELON = "Looks like a head..",
		WATERMELON_COOKED = "It's bad when it's warm..",
		WATERMELONHAT = "I feel so alive with this on..",
		WETGOOP = "Well that's disgusting..",
		WINTERHAT = "At least it doesn't too bad..",
		WINTEROMETER = 
		{
			GENERIC = "Finally some worthwhile info!",
			BURNT = "God damn it!",
		},
		WORMHOLE =
		{
			GENERIC = "What the hell..",
			OPEN = "Why the hell do I feel like jumping in!?",
		},
		WORMHOLE_LIMITED = "It looks like it's about to die soon..",
		ACCOMPLISHMENT_SHRINE = "A trophy? For what?",        
		LIVINGTREE = "I know the feeling..",
		ICESTAFF = "A comfortable weapon..",
		REVIVER = "A sacrifice must be made..",
		LIFEINJECTOR = "I hope this doesn't have any side effects..",
		SKELETON_PLAYER =
		{
			MALE = "%s must've messed with %s..",
			FEMALE = "%s must've messed with %s..",
			ROBOT = "%s must've messed with %s..",
			DEFAULT = "%s must've messed with %s..",
		},
		HUMANMEAT = "It's delicious!",
		HUMANMEAT_COOKED = "It's even better now!",
		HUMANMEAT_DRIED = "It has a poignant taste to it now!",
		MOONROCKNUGGET = "A chunk of space. Great..",
	},
	DESCRIBE_GENERIC = "Would you look at that..",
	DESCRIBE_TOODARK = "I can't see. Great..!",
	DESCRIBE_SMOLDERING = "Damn! It's about to catch flames.",
	EAT_FOOD =
	{
		TALLBIRDEGG_CRACKED = "Not that great..",
	},
}
