package net.spider
{
    import flash.display.MovieClip;
    import flash.events.EventDispatcher;
    import flash.net.SharedObject;
    import flash.system.ApplicationDomain;
    import flash.net.URLLoader;
    import flash.display.Loader;
    import flash.net.URLRequest;
    import flash.utils.Timer;
    import flash.events.Event;
    import flash.geom.Point;
    import net.spider.handlers.SFSEvent;
    import net.spider.handlers.ClientEvent;
    import flash.system.Capabilities;
    import flash.events.MouseEvent;
    import flash.system.Security;
    import flash.events.ProgressEvent;
    import flash.system.LoaderContext;
    import flash.display.DisplayObjectContainer;
    import flash.events.TimerEvent;
    import net.spider.draw.forestbg;
    import net.spider.draw.iconDrops;
    import net.spider.draw.iconMount;
    import net.spider.handlers.optionHandler;
    import net.spider.handlers.modules;
    import net.spider.draw.travelMenu;
    import net.spider.handlers.dropmenu;
    import net.spider.handlers.dropmenutwo;
    import net.spider.modules.cskillanim;
    import net.spider.modules.qpin;
    import net.spider.modules.qlog;
    import net.spider.handlers.skills;
    import net.spider.handlers.targetskills;
    import net.spider.modules.houseentrance;
    import net.spider.handlers.chatui;
    import net.spider.draw.cMenu;
    import flash.utils.getQualifiedClassName;
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    import flash.net.*;
    import net.spider.modules.*;
    import net.spider.draw.*;
    import flash.system.*;
    import flash.ui.*;
    import net.spider.handlers.*;

    public class main extends MovieClip 
    {

        public static var events:EventDispatcher = new EventDispatcher();
        public static var Game:Object;
        public static var aqlData:SharedObject;
        public static var _stage:*;
        public static var rootDisplay:*;
        public static var dropMenu:*;
        public static var gameDomain:ApplicationDomain;
        public static var curVersion:Number = 17;
        public static var isUpdated:Boolean;
        public static var latestVersion:String = "17";

        public var loader:MovieClip;
        internal var sURL:* = "https://game.aq.com/game/";
        internal var gameFile:* = "api/data/gameversion";
        internal var sFile:*;
        internal var aqliteLoader:URLLoader;
        internal var versionLoader:URLLoader;
        internal var swfLoader:Loader;
        internal var swfRequest:URLRequest;
        internal var titleDomain:ApplicationDomain;
        internal var loginURL:String = "https://game.aq.com/game/api/login/now";
        internal var sBG:String;
        internal var hasEvent:Boolean = false;
        private var hasLeft:Boolean = false;
        private var waitForLogin:Timer = new Timer(0);
        internal var travelMenuFlag:Boolean = false;
        internal var runOnce:Boolean;
        internal var modulesInit:Boolean = false;

        public function main()
        {
            this.addEventListener(Event.ADDED_TO_STAGE, this.stageHandler);
            addEventListener(Event.ADDED_TO_STAGE, this.__setPerspectiveProjection_);
        }

        public static function get sharedObject():SharedObject
        {
            if (!aqlData)
            {
                aqlData = SharedObject.getLocal("AQLite_Data", "/");
            };
            return (aqlData);
        }

        public static function debug(str:String):*
        {
            main.Game.chatF.pushMsg("server", str, "AQLite", "", 0);
        }


        public function __setPerspectiveProjection_(evt:Event):void
        {
            root.transform.perspectiveProjection.fieldOfView = 84.51821;
            root.transform.perspectiveProjection.projectionCenter = new Point(480, 275);
        }

        public function onCostumePending(e:ClientEvent):void
        {
            if (!this.hasEvent)
            {
                Game.sfc.addEventListener(SFSEvent.onExtensionResponse, this.onExtensionResponseHandler);
                this.hasEvent = true;
            };
        }

        public function onExtensionResponseHandler(e:*):void
        {
            var dItem:*;
            var dID:*;
            var resObj:*;
            var cmd:*;
            var slot:*;
            var protocol:* = e.params.type;
            if (protocol == "json")
            {
                resObj = e.params.dataObj;
                cmd = resObj.cmd;
                switch (cmd)
                {
                    case "moveToArea":
                        for (slot in main.Game.world.myAvatar.objData.eqp)
                        {
                            if (main.Game.world.myAvatar.objData.eqp[slot].wasCreated)
                            {
                                delete main.Game.world.myAvatar.objData.eqp[slot];
                                main.Game.world.myAvatar.unloadMovieAtES(slot);
                            }
                            else
                            {
                                if (slot == "pe")
                                {
                                    if (main.Game.world.myAvatar.objData.eqp["pe"])
                                    {
                                        main.Game.world.myAvatar.unloadPet();
                                    };
                                };
                                if (main.Game.world.myAvatar.objData.eqp[slot].isPreview)
                                {
                                    main.Game.world.myAvatar.objData.eqp[slot].sType = main.Game.world.myAvatar.objData.eqp[slot].oldType;
                                    main.Game.world.myAvatar.objData.eqp[slot].sFile = main.Game.world.myAvatar.objData.eqp[slot].oldFile;
                                    main.Game.world.myAvatar.objData.eqp[slot].sLink = main.Game.world.myAvatar.objData.eqp[slot].oldLink;
                                    main.Game.world.myAvatar.loadMovieAtES(slot, main.Game.world.myAvatar.objData.eqp[slot].oldFile, main.Game.world.myAvatar.objData.eqp[slot].oldLink);
                                    main.Game.world.myAvatar.objData.eqp[slot].isPreview = null;
                                };
                            };
                        };
                        Game.sfc.removeEventListener(SFSEvent.onExtensionResponse, this.onExtensionResponseHandler);
                        this.hasEvent = false;
                        break;
                };
            };
        }

        private function stageHandler(e:Event):void
        {
            trace(Capabilities.version);
            main.events.addEventListener(ClientEvent.onCostumePending, this.onCostumePending);
            aqlData = SharedObject.getLocal("AQLite_Data", "/");
            aqlData.flush();
            addFrameScript(0, this.frame1);
            stage.addEventListener(Event.MOUSE_LEAVE, this.focusGame);
            stage.addEventListener(MouseEvent.MOUSE_OVER, this.refocusGame);
        }

        public function focusGame(e:*):void
        {
            if (!this.hasLeft)
            {
                this.hasLeft = true;
            };
        }

        public function refocusGame(e:*):void
        {
            if (this.hasLeft)
            {
                stage.focus = null;
                this.hasLeft = false;
            };
        }

        public function frame1():void
        {
            _stage = stage;
            Security.allowDomain("*");
            Security.allowInsecureDomain("*");
            stop();
            this.GetVersion();
        }

        internal function LoadGame():*
        {
            this.swfLoader = new Loader();
            this.swfRequest = new URLRequest(((this.sURL + "gamefiles/") + this.sFile));
            this.swfLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, this.onGameComplete, false, 0, true);
            this.swfLoader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, this.onProgress, false, 0, true);
            this.swfLoader.load(this.swfRequest, new LoaderContext(false, ApplicationDomain.currentDomain));
        }

        internal function onGameComplete(loadEvent:Event):*
        {
            var v:*;
            rootDisplay = (root as DisplayObjectContainer);
            dropMenu = (root as DisplayObjectContainer).getChildByName("dropsUI2");
            stage.addChildAt(MovieClip(loadEvent.currentTarget.content), 0);
            loadEvent.currentTarget.content.y = 0;
            loadEvent.currentTarget.content.x = 0;
            Game = Object(loadEvent.currentTarget.content).root;
            gameDomain = loadEvent.currentTarget.applicationDomain;
            for (v in root.loaderInfo.parameters)
            {
                trace(((v + ": ") + root.loaderInfo.parameters[v]));
                Game.params[v] = root.loaderInfo.parameters[v];
            };
            Game.params.sURL = this.sURL;
            Game.params.sTitle = "AQLite";
            Game.params.isWeb = false;
            Game.params.doSignup = false;
            Game.params.loginURL = this.loginURL;
            Game.params.sBG = "";
            Game.titleDomain = this.titleDomain;
            this.waitForLogin.addEventListener(TimerEvent.TIMER, this.onWait);
            this.waitForLogin.start();
        }

        internal function onWait(e:TimerEvent):void
        {
            var newBG:forestbg;
            if (Game.mcLogin)
            {
                if (Game.mcLogin.currentLabel == "GetLauncher")
                {
                    Game.mcLogin.gotoAndStop("Init");
                };
                if (!Game.mcLogin.mcTitle.getChildByName("forest"))
                {
                    Game.mcLogin.mcTitle.removeChildAt(0);
                    newBG = new forestbg();
                    newBG.name = "forest";
                    Game.mcLogin.mcTitle.addChild(newBG);
                    Game.mcLogin.mcTitle.visible = true;
                };
            };
            if (Game.sfc.isConnected)
            {
                if (((!(Game.world.actions.active == null)) && (!(Game.world.mapLoadInProgress))))
                {
                    if (((Game.world.myAvatar.invLoaded) && (Game.world.myAvatar.pMC.artLoaded())))
                    {
                        this.waitForLogin.reset();
                        this.waitForLogin.removeEventListener(TimerEvent.TIMER, this.onWait);
                        this.waitForLogin.addEventListener(TimerEvent.TIMER, this.onLogout);
                        this.waitForLogin.start();
                        this.runOnce = false;
                    };
                };
            };
        }

        internal function onLogout(e:TimerEvent):void
        {
            var _menu:iconDrops;
            var _mnt_menu:iconMount;
            var i:*;
            if (!Game.sfc.isConnected)
            {
                this.travelMenuFlag = ((optionHandler.travelMenuMC) ? true : false);
                if (this.travelMenuFlag)
                {
                    optionHandler.travelMenuMC = null;
                };
                this.waitForLogin.reset();
                this.waitForLogin.addEventListener(TimerEvent.TIMER, this.onWait);
                this.waitForLogin.start();
            };
            if (((!(this.runOnce)) && (Game.ui)))
            {
                if (!this.modulesInit)
                {
                    modules.create();
                    this.modulesInit = true;
                };
                Game.ui.mcPortrait.addEventListener(MouseEvent.CLICK, this.targetPlayer, false, 0, true);
                Game.ui.mcPortrait.removeEventListener(MouseEvent.CLICK, Game.portraitClick);
                Game.ui.mcPortraitTarget.addEventListener(MouseEvent.CLICK, this.targetPlayer, false, 0, true);
                Game.ui.mcPortraitTarget.removeEventListener(MouseEvent.CLICK, Game.portraitClick);
                if (((this.travelMenuFlag) && (!(Game.ui.getChildByName("travelMenuMC")))))
                {
                    this.travelMenuFlag = false;
                    optionHandler.travelMenuMC = new travelMenu();
                    optionHandler.travelMenuMC.name = "travelMenuMC";
                    Game.ui.addChild(optionHandler.travelMenuMC);
                };
                if (!Game.ui.mcPortrait.getChildByName("iconDrops"))
                {
                    _menu = new iconDrops();
                    _menu.name = "iconDrops";
                    Game.ui.mcPortrait.addChild(_menu);
                    _menu.x = 40;
                    _menu.y = 72.15;
                    _menu.visible = ((optionHandler.cDrops) || (optionHandler.sbpcDrops));
                };
                if (!Game.ui.mcPortrait.getChildByName("iconMount"))
                {
                    _mnt_menu = new iconMount();
                    _mnt_menu.name = "iconMount";
                    Game.ui.mcPortrait.addChild(_mnt_menu);
                    _mnt_menu.x = 187.9;
                    _mnt_menu.y = 62.35;
                    _mnt_menu.visible = optionHandler.bBetterMounts;
                };
                if (((optionHandler.cDrops) && (!(Game.ui.getChildByName("dropmenu")))))
                {
                    optionHandler.dropmenuMC = new dropmenu();
                    optionHandler.dropmenuMC.name = "dropmenu";
                    Game.ui.addChild(optionHandler.dropmenuMC);
                };
                if (((optionHandler.sbpcDrops) && (!(Game.ui.getChildByName("dropmenutwo")))))
                {
                    optionHandler.dropmenutwoMC = new dropmenutwo();
                    optionHandler.dropmenutwoMC.name = "dropmenutwo";
                    Game.ui.addChild(optionHandler.dropmenutwoMC);
                };
                if (((optionHandler.cSkillAnim) && (Game.ui)))
                {
                    i = 2;
                    while (i < 6)
                    {
                        if (Game.ui.mcInterface.actBar.getChildByName(("i" + i)))
                        {
                            Game.ui.mcInterface.actBar.getChildByName(("i" + i)).addEventListener(MouseEvent.CLICK, cskillanim.actIconClick, false, 0, true);
                        };
                        i++;
                    };
                };
                if (((optionHandler.qPin) && (Game.ui)))
                {
                    Game.ui.iconQuest.addEventListener(MouseEvent.CLICK, qpin.onPinQuests);
                    Game.ui.iconQuest.removeEventListener(MouseEvent.CLICK, Game.oniconQuestClick);
                };
                if (((optionHandler.qLog) && (Game.ui.mcInterface.mcMenu.btnQuest)))
                {
                    Game.ui.mcInterface.mcMenu.btnQuest.addEventListener(MouseEvent.CLICK, qlog.onRegister, false, 0, true);
                };
                if (((optionHandler.skill) && (Game.ui)))
                {
                    if (!Game.ui.getChildByName("skillsMC"))
                    {
                        optionHandler.skillsMC = new skills();
                        optionHandler.skillsMC.name = "skillsMC";
                        Game.ui.addChild(optionHandler.skillsMC);
                        optionHandler.targetskillsMC = new targetskills();
                        optionHandler.targetskillsMC.name = "targetskillsMC";
                        Game.ui.addChild(optionHandler.targetskillsMC);
                    };
                };
                if (optionHandler.bHouseEntrance)
                {
                    Game.ui.mcInterface.mcMenu.btnHouse.addEventListener(MouseEvent.CLICK, houseentrance.onHouseClick, false, 0, true);
                    houseentrance.houseEvent = true;
                };
                if ((((optionHandler.bCChat) && (Game.ui)) && (!(Game.ui.mcInterface.getChildByName("chatui")))))
                {
                    optionHandler.chatuiMC = new chatui();
                    optionHandler.chatuiMC.name = "chatui";
                    Game.ui.mcInterface.addChild(optionHandler.chatuiMC);
                };
                Game.world.myAvatar.factions.sortOn("sName");
                Game.ui.mcUpdates.mouseEnabled = (Game.ui.mcUpdates.mouseChildren = false);
                this.runOnce = true;
            };
        }

        internal function targetPlayer(param1:MouseEvent):void
        {
            var _menu:cMenu;
            if (getQualifiedClassName(param1.target).indexOf("ib2") > -1)
            {
                return;
            };
            var _loc2_:* = undefined;
            var _loc3_:* = undefined;
            _loc2_ = MovieClip(param1.currentTarget);
            if (!Game.ui.getChildByName("customMenu"))
            {
                _menu = new cMenu();
                _menu.name = "customMenu";
                Game.ui.addChild(_menu);
            };
            var nuMenu:* = Game.ui.getChildByName("customMenu");
            if (_loc2_.pAV.npcType == "player")
            {
                _loc3_ = {};
                _loc3_.ID = _loc2_.pAV.objData.CharID;
                _loc3_.strUsername = _loc2_.pAV.objData.strUsername;
                if (_loc2_.pAV != Game.world.myAvatar)
                {
                    nuMenu.fOpenWith("user", _loc3_);
                }
                else
                {
                    nuMenu.fOpenWith("self", _loc3_);
                };
            }
            else
            {
                _loc3_ = {};
                _loc3_.ID = _loc2_.pAV.objData.MonMapID;
                _loc3_.strUsername = _loc2_.pAV.objData.strMonName;
                _loc3_.target = main.Game.world.getMonster(_loc3_.ID).pMC;
                nuMenu.fOpenWith("mons", _loc3_);
            };
        }

        internal function GetVersion():*
        {
            this.aqliteLoader = new URLLoader();
            this.aqliteLoader.addEventListener(Event.COMPLETE, this.onAQLiteVersion, false, 0, true);
            this.aqliteLoader.load(new URLRequest("https://api.github.com/repos/133spider/AQLite/releases/latest"));
            this.versionLoader = new URLLoader();
            this.versionLoader.addEventListener(Event.COMPLETE, this.onVersionComplete, false, 0, true);
            this.versionLoader.load(new URLRequest((this.sURL + this.gameFile)));
        }

        internal function onProgress(arg1:ProgressEvent):void
        {
            var loc1:* = ((arg1.currentTarget.bytesLoaded / arg1.currentTarget.bytesTotal) * 100);
            this.loader.progress.text = (Math.floor(loc1).toString() + "%");
            if (loc1 == 100)
            {
                this.removeChild(this.loader);
            };
        }

        internal function onVersionComplete(_arg_1:Event):*
        {
            var _local_2:Object = JSON.parse(_arg_1.target.data);
            this.sFile = _local_2.sFile;
            this.sBG = _local_2.sBG;
            this.titleDomain = new ApplicationDomain();
            this.LoadGame();
            this.versionLoader.removeEventListener(Event.COMPLETE, this.onVersionComplete);
            this.versionLoader = null;
        }

        internal function onAQLiteVersion(param1:Event):*
        {
            var vars:String = param1.target.data;
            latestVersion = vars.substring((vars.indexOf('"tag_name":') + 11));
            latestVersion = latestVersion.substring((latestVersion.indexOf('"') + 1));
            latestVersion = latestVersion.substring(0, latestVersion.indexOf('"'));
            if (Number(latestVersion) <= curVersion)
            {
                isUpdated = true;
            };
            trace(("[AQLITE NEWEST VERSION]: " + latestVersion));
            trace(("[AQLITE VERSION]: " + curVersion));
            this.aqliteLoader.removeEventListener(Event.COMPLETE, this.onAQLiteVersion);
            this.aqliteLoader = null;
        }
    }
}