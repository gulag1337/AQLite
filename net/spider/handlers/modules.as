package net.spider.handlers
{
    import flash.display.MovieClip;
    import flash.utils.Timer;
    import __AS3__.vec.Vector;
    import net.spider.draw.mcAC;
    import net.spider.draw.btColorPicker;
    import net.spider.avatar.CombatMC;
    import net.spider.modules.drops;
    import net.spider.modules.skillanim;
    import net.spider.modules.hideplayers;
    import net.spider.modules.monstype;
    import net.spider.modules.qrates;
    import net.spider.modules.qprev;
    import net.spider.modules.qlog;
    import net.spider.modules.untarget;
    import net.spider.modules.untargetself;
    import net.spider.modules.diswepanim;
    import net.spider.modules.detaildrops;
    import net.spider.modules.detailquests;
    import net.spider.modules.dismonanim;
    import net.spider.modules.bitmap;
    import net.spider.modules.cskillanim;
    import net.spider.modules.qaccept;
    import net.spider.modules.qpin;
    import net.spider.modules.dismapanim;
    import net.spider.modules.lockmons;
    import net.spider.modules.smoothbg;
    import net.spider.modules.colorsets;
    import net.spider.modules.hidemonsters;
    import net.spider.modules.hidepnames;
    import net.spider.modules.battlepet;
    import net.spider.modules.questnotif;
    import net.spider.modules.disquesttracker;
    import net.spider.modules.bankkey;
    import net.spider.modules.dispetanim;
    import net.spider.modules.transquest;
    import net.spider.modules.bettermounts;
    import net.spider.modules.hidewep;
    import net.spider.main;
    import flash.events.Event;
    import flash.events.KeyboardEvent;
    import flash.events.TimerEvent;
    import flash.events.MouseEvent;
    import net.spider.draw.theArchive;
    import net.spider.draw.invSearch;
    import flash.utils.getQualifiedClassName;
    import net.spider.draw.bankfilters;
    import flash.display.Shape;
    import net.spider.draw.mergeScroll;
    import com.adobe.utils.StringUtil;
    import net.spider.draw.btGender;
    import net.spider.draw.btSetMount;
    import net.spider.draw.tryMe;
    import net.spider.draw.showBt;
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    import flash.net.*;
    import net.spider.modules.*;
    import net.spider.draw.*;
    import flash.system.*;
    import flash.ui.*;
    import flash.geom.*;
    import net.spider.avatar.*;

    public class modules extends MovieClip 
    {

        private static var maintainTimer:Timer;
        private static var moduleList:Vector.<Object>;
        private static var t_mcAC:mcAC;
        internal static var mDown:Boolean = false;
        internal static var hRun:int = 0;
        internal static var dRun:int = 0;
        internal static var mbY:int = 0;
        internal static var mhY:int = 0;
        internal static var mbD:int = 0;
        internal static var cachedItem:int = 0;
        internal static var mergeScrollFlag:Boolean = false;
        internal static var mcbtColorPicker:btColorPicker;
        private static var performOnceFlag:Boolean = false;
        private static var inCombat:Boolean = false;
        public static var relCombatMC:CombatMC;
        private static var f_itemsDrawn:Boolean = false;
        private static var f_savedISel:Number;
        public static var _tempMC:CombatMC;


        public static function create():void
        {
            moduleList = new <Object>[{
                "moduleClass":passives,
                "moduleType":"Frame",
                "responseHandler":false,
                "keyHandler":false
            }, {
                "moduleClass":drops,
                "moduleType":"Frame",
                "responseHandler":true,
                "keyHandler":false
            }, {
                "moduleClass":skillanim,
                "moduleType":"Timer",
                "responseHandler":false,
                "keyHandler":false
            }, {
                "moduleClass":hideplayers,
                "moduleType":"Frame",
                "responseHandler":false,
                "keyHandler":false
            }, {
                "moduleClass":monstype,
                "moduleType":"Frame",
                "responseHandler":false,
                "keyHandler":false
            }, {
                "moduleClass":qrates,
                "moduleType":"Frame",
                "responseHandler":false,
                "keyHandler":false
            }, {
                "moduleClass":qprev,
                "moduleType":"Frame",
                "responseHandler":false,
                "keyHandler":false
            }, {
                "moduleClass":qlog,
                "moduleType":"",
                "responseHandler":false,
                "keyHandler":true
            }, {
                "moduleClass":untarget,
                "moduleType":"Timer",
                "responseHandler":false,
                "keyHandler":false
            }, {
                "moduleClass":untargetself,
                "moduleType":"Timer",
                "responseHandler":false,
                "keyHandler":false
            }, {
                "moduleClass":diswepanim,
                "moduleType":"Frame",
                "responseHandler":false,
                "keyHandler":false
            }, {
                "moduleClass":detaildrops,
                "moduleType":"Frame",
                "responseHandler":true,
                "keyHandler":false
            }, {
                "moduleClass":detailquests,
                "moduleType":"Frame",
                "responseHandler":false,
                "keyHandler":false
            }, {
                "moduleClass":dismonanim,
                "moduleType":"Frame",
                "responseHandler":false,
                "keyHandler":false
            }, {
                "moduleClass":bitmap,
                "moduleType":"Frame",
                "responseHandler":false,
                "keyHandler":false
            }, {
                "moduleClass":cskillanim,
                "moduleType":"Timer",
                "responseHandler":true,
                "keyHandler":true
            }, {
                "moduleClass":qaccept,
                "moduleType":"",
                "responseHandler":true,
                "keyHandler":false
            }, {
                "moduleClass":qpin,
                "moduleType":"Frame",
                "responseHandler":false,
                "keyHandler":false
            }, {
                "moduleClass":dismapanim,
                "moduleType":"Frame",
                "responseHandler":false,
                "keyHandler":false
            }, {
                "moduleClass":lockmons,
                "moduleType":"Timer",
                "responseHandler":false,
                "keyHandler":false
            }, {
                "moduleClass":smoothbg,
                "moduleType":"Frame",
                "responseHandler":false,
                "keyHandler":false
            }, {
                "moduleClass":colorsets,
                "moduleType":"Frame",
                "responseHandler":false,
                "keyHandler":false
            }, {
                "moduleClass":boosts,
                "moduleType":"Timer",
                "responseHandler":false,
                "keyHandler":false
            }, {
                "moduleClass":hidemonsters,
                "moduleType":"Frame",
                "responseHandler":false,
                "keyHandler":false
            }, {
                "moduleClass":hidepnames,
                "moduleType":"Frame",
                "responseHandler":false,
                "keyHandler":false
            }, {
                "moduleClass":battlepet,
                "moduleType":"",
                "responseHandler":true,
                "keyHandler":false
            }, {
                "moduleClass":questnotif,
                "moduleType":"",
                "responseHandler":true,
                "keyHandler":false
            }, {
                "moduleClass":disquesttracker,
                "moduleType":"Timer",
                "responseHandler":false,
                "keyHandler":false
            }, {
                "moduleClass":bankkey,
                "moduleType":"",
                "responseHandler":false,
                "keyHandler":true
            }, {
                "moduleClass":dispetanim,
                "moduleType":"Frame",
                "responseHandler":false,
                "keyHandler":false
            }, {
                "moduleClass":transquest,
                "moduleType":"Frame",
                "responseHandler":false,
                "keyHandler":false
            }, {
                "moduleClass":bettermounts,
                "moduleType":"Timer",
                "responseHandler":true,
                "keyHandler":false
            }, {
                "moduleClass":hidewep,
                "moduleType":"Frame",
                "responseHandler":false,
                "keyHandler":false
            }];
            optionHandler.readSettings();
            main.Game.sfc.addEventListener(SFSEvent.onExtensionResponse, onExtensionResponseHandler);
            main._stage.addEventListener(Event.ENTER_FRAME, onMaintainFrame);
            main._stage.addEventListener(KeyboardEvent.KEY_UP, onMaintainKeys);
            maintainTimer = new Timer(0);
            maintainTimer.addEventListener(TimerEvent.TIMER, onMaintainTimer);
            maintainTimer.start();
        }

        public static function onMcGoldMouseOver(e:MouseEvent):void
        {
            t_mcAC.strAC.text = main.Game.world.myAvatar.objData.intCoins;
            t_mcAC.visible = true;
        }

        public static function onMcGoldMouseOut(e:MouseEvent):void
        {
            t_mcAC.visible = false;
        }

        public static function onWheel(e:MouseEvent):void
        {
            var book:MovieClip = MovieClip(main.Game.ui.mcPopup.mcBook.getChildAt(0).content);
            if (e.delta > 0)
            {
                book.btnLeft.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
            }
            else
            {
                book.btnRight.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
            };
        }

        public static function onInvWheel(e:MouseEvent):void
        {
            var i:Number;
            var j:Number;
            var inv:MovieClip = MovieClip(e.currentTarget.scr);
            if (e.delta > 0)
            {
                if (main.Game.ui.mcPopup.currentLabel == "MergeShop")
                {
                    e.currentTarget.scr.h.y = (e.currentTarget.scr.h.y - ((e.delta * 3) * 1.1));
                    if ((e.currentTarget.scr.h.y + e.currentTarget.scr.h.height) > e.currentTarget.scr.b.height)
                    {
                        e.currentTarget.scr.h.y = int((e.currentTarget.scr.b.height - e.currentTarget.scr.h.height));
                    };
                    if (e.currentTarget.scr.h.y < 0)
                    {
                        e.currentTarget.scr.h.y = 0;
                    };
                    return;
                };
                i = 0;
                while (i < e.delta)
                {
                    inv.a1.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
                    i++;
                };
            }
            else
            {
                j = 0;
                while (j < (e.delta * -1))
                {
                    inv.a2.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
                    j++;
                };
            };
        }

        public static function onQuestWheel(e:MouseEvent):void
        {
            var quest:MovieClip = MovieClip(e.currentTarget.scr);
            quest.h.y = (quest.h.y + ((e.delta * -1) * 3));
            if (quest.h.y < 0)
            {
                quest.h.y = 0;
            };
            if ((quest.h.y + quest.h.height) > quest.b.height)
            {
                quest.h.y = int((quest.b.height - quest.h.height));
            };
        }

        public static function onBankWheel(e:MouseEvent):void
        {
            var oldY:Number;
            var i:Number;
            var j:Number;
            if (e.delta > 0)
            {
                oldY = e.currentTarget.scr.h.y;
                i = 0;
                while (i < e.delta)
                {
                    MovieClip(e.currentTarget.scr).a1.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
                    i++;
                };
                if (oldY == e.currentTarget.scr.h.y)
                {
                    e.currentTarget.scr.h.y = (e.currentTarget.scr.h.y - (e.delta * 1.1));
                    if ((e.currentTarget.scr.h.y + e.currentTarget.scr.h.height) > e.currentTarget.scr.b.height)
                    {
                        e.currentTarget.scr.h.y = int((e.currentTarget.scr.b.height - e.currentTarget.scr.h.height));
                    };
                    if (e.currentTarget.scr.h.y < 0)
                    {
                        e.currentTarget.scr.h.y = 0;
                    };
                };
            }
            else
            {
                j = 0;
                while (j < (e.delta * -1))
                {
                    MovieClip(e.currentTarget.scr).a2.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
                    j++;
                };
            };
        }

        public static function onBtArchive(e:MouseEvent):void
        {
            var book:MovieClip = MovieClip(main.Game.ui.mcPopup.mcBook.getChildAt(0).content);
            var _archive:theArchive = new theArchive();
            main._stage.addChild(_archive);
            book.questList.removeEventListener(Event.ENTER_FRAME, book.dEF);
            book.btnBack.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
        }

        public static function _func_flag(e:MouseEvent):void
        {
            trace("Garbage temporary function flag for btnQuests");
        }

        public static function isPreviewable():Boolean
        {
            if (((main.Game.ui.mcPopup.getChildByName("mcShop")) && (!(main.Game.ui.mcPopup.currentLabel == "MergeShop"))))
            {
                if (main.Game.ui.mcPopup.getChildByName("mcShop").splitPanel.visible)
                {
                    return (false);
                };
            };
            if (main.Game.ui.mcPopup.getChildByName("mcInventory"))
            {
                if (main.Game.ui.mcPopup.getChildByName("mcInventory").splitPanel.visible)
                {
                    return (false);
                };
            };
            if (!main.Game.ui.mcPopup.getChildByName("mcShop"))
            {
                return (false);
            };
            if (!main.Game.ui.mcPopup.getChildByName("mcShop").iSel)
            {
                return (false);
            };
            switch (main.Game.ui.mcPopup.getChildByName("mcShop").iSel.sES)
            {
                case "Weapon":
                case "he":
                case "ba":
                case "pe":
                case "ar":
                case "co":
                    if (main.Game.ui.mcPopup.getChildByName("mcShop").iSel.bUpg == 1)
                    {
                        if (!main.Game.world.myAvatar.isUpgraded())
                        {
                            return (false);
                        };
                    };
                    return (true);
                case "ho":
                case "hi":
                default:
                    return (false);
            };
        }

        public static function isShowable():Boolean
        {
            if (!main.Game.ui.mcPopup.getChildByName("mcInventory"))
            {
                return (false);
            };
            if (!main.Game.ui.mcPopup.getChildByName("mcInventory").iSel)
            {
                return (false);
            };
            switch (main.Game.ui.mcPopup.getChildByName("mcInventory").iSel.sES)
            {
                case "Weapon":
                case "he":
                case "ba":
                case "ar":
                case "co":
                    if (main.Game.ui.mcPopup.getChildByName("mcInventory").iSel.bUpg == 1)
                    {
                        if (!main.Game.world.myAvatar.isUpgraded())
                        {
                            return (false);
                        };
                    };
                    return (true);
                case "pe":
                case "ho":
                case "hi":
                default:
                    return (false);
            };
        }

        public static function isGender(mcFocus:String):Boolean
        {
            if (main.Game.ui.mcPopup.currentLabel != "MergeShop")
            {
                if (main.Game.ui.mcPopup.getChildByName(mcFocus).splitPanel.visible)
                {
                    return (false);
                };
            };
            if (!main.Game.ui.mcPopup.getChildByName(mcFocus).iSel)
            {
                return (false);
            };
            switch (main.Game.ui.mcPopup.getChildByName(mcFocus).iSel.sES)
            {
                case "ar":
                case "co":
                    return (true);
                default:
                    return (false);
            };
        }

        public static function isMount():Boolean
        {
            if (!main.Game.ui.mcPopup.getChildByName("mcInventory"))
            {
                return (false);
            };
            if (main.Game.ui.mcPopup.getChildByName("mcInventory"))
            {
                if (main.Game.ui.mcPopup.getChildByName("mcInventory").splitPanel.visible)
                {
                    return (false);
                };
            };
            if (!main.Game.ui.mcPopup.getChildByName("mcInventory").iSel)
            {
                return (false);
            };
            switch (main.Game.ui.mcPopup.getChildByName("mcInventory").iSel.sES)
            {
                case "ar":
                case "co":
                    return (true);
                default:
                    return (false);
            };
        }

        private static function merge_scrDown(param1:MouseEvent):*
        {
            mbY = int(param1.currentTarget.parent.mouseY);
            mhY = int(MovieClip(param1.currentTarget.parent).h.y);
            mDown = true;
            main._stage.addEventListener(MouseEvent.MOUSE_UP, merge_scrUp, false, 0, true);
        }

        private static function merge_scrUp(param1:MouseEvent):*
        {
            mDown = false;
            main._stage.removeEventListener(MouseEvent.MOUSE_UP, merge_scrUp);
        }

        private static function merge_hEF(param1:Event):*
        {
            var _loc2_:* = undefined;
            if (mDown)
            {
                _loc2_ = MovieClip(param1.currentTarget.parent);
                mbD = (int(param1.currentTarget.parent.mouseY) - mbY);
                _loc2_.h.y = (mhY + mbD);
                if ((_loc2_.h.y + _loc2_.h.height) > _loc2_.b.height)
                {
                    _loc2_.h.y = int((_loc2_.b.height - _loc2_.h.height));
                };
                if (_loc2_.h.y < 0)
                {
                    _loc2_.h.y = 0;
                };
            };
        }

        private static function merge_dEF(param1:Event):*
        {
            var _loc2_:* = MovieClip(param1.currentTarget.parent).getChildByName("scrollMC");
            var _loc3_:* = MovieClip(param1.currentTarget);
            var _loc4_:* = (-(_loc2_.h.y) / hRun);
            var _loc5_:* = (int((_loc4_ * dRun)) + _loc3_.oy);
            if (Math.abs((_loc5_ - _loc3_.y)) > 0.2)
            {
                _loc3_.y = (_loc3_.y + ((_loc5_ - _loc3_.y) / 4));
            }
            else
            {
                _loc3_.y = _loc5_;
            };
        }

        public static function onMergeBoxScroll(e:MouseEvent):void
        {
            var mc_merge:MovieClip = MovieClip(e.currentTarget.getChildByName("scrollMC"));
            mc_merge.h.y = (mc_merge.h.y + ((e.delta * -1) * 6));
            if (mc_merge.h.y < 0)
            {
                mc_merge.h.y = 0;
            };
            if ((mc_merge.h.y + mc_merge.h.height) > mc_merge.b.height)
            {
                mc_merge.h.y = int((mc_merge.b.height - mc_merge.h.height));
            };
        }

        public static function onMaintainFrame(e:Event):void
        {
            var _module:* = undefined;
            var mcDynamicOptions:* = undefined;
            var book:MovieClip;
            var invBackdrop:* = undefined;
            var invSearchMC:invSearch;
            var frame:MovieClip;
            var bank:MovieClip;
            var inv:MovieClip;
            var mcDrop:* = undefined;
            if (((!(main.Game)) || (!(main.Game.ui))))
            {
                return;
            };
            for each (_module in moduleList)
            {
                if (_module.moduleType == "Frame")
                {
                    _module.moduleClass.onFrameUpdate();
                };
            };
            if (main.Game.ui.mcPopup.currentLabel == "Book")
            {
                if (main.Game.ui.mcPopup.mcBook)
                {
                    book = MovieClip(main.Game.ui.mcPopup.mcBook.getChildAt(0).content);
                    if (book)
                    {
                        if (((book.btnRight) && (!(book.btnRight.hasEventListener(MouseEvent.MOUSE_WHEEL)))))
                        {
                            book.addEventListener(MouseEvent.MOUSE_WHEEL, onWheel, false, 0, true);
                        }
                        else
                        {
                            if (((book.btnRight) && (book.btnRight.hasEventListener(MouseEvent.MOUSE_WHEEL))))
                            {
                                book.removeEventListener(MouseEvent.MOUSE_WHEEL, onWheel);
                            };
                        };
                        if (((book.btnQuests) && (!(book.btnQuests.hasEventListener(MouseEvent.DOUBLE_CLICK)))))
                        {
                            if (optionHandler.bTheArchive)
                            {
                                book.btnQuests.addEventListener(MouseEvent.CLICK, onBtArchive, false, 0, true);
                            };
                            book.btnQuests.addEventListener(MouseEvent.DOUBLE_CLICK, _func_flag, false, 0, true);
                        }
                        else
                        {
                            if (((book.btnQuests) && (book.btnQuests.hasEventListener(MouseEvent.DOUBLE_CLICK))))
                            {
                                if (optionHandler.bTheArchive)
                                {
                                    book.btnQuests.removeEventListener(MouseEvent.CLICK, onBtArchive);
                                };
                                book.btnQuests.removeEventListener(MouseEvent.DOUBLE_CLICK, _func_flag);
                            };
                        };
                    };
                };
            };
            if (((main.Game.ui.mcPopup.getChildByName("mcCustomizeArmor")) && (!(main.Game.ui.mcPopup.mcCustomizeArmor.getChildByName("mcBtColorPicker")))))
            {
                mcbtColorPicker = new btColorPicker();
                mcbtColorPicker.name = "mcBtColorPicker";
                mcbtColorPicker.x = main.Game.ui.mcPopup.mcCustomizeArmor.btnClose.x;
                mcbtColorPicker.y = ((main.Game.ui.mcPopup.mcCustomizeArmor.btnClose.y + mcbtColorPicker.height) + 3);
                main.Game.ui.mcPopup.mcCustomizeArmor.addChild(mcbtColorPicker);
            };
            if (((main.Game.ui.mcPopup.getChildByName("mcCustomize")) && (!(main.Game.ui.mcPopup.mcCustomize.getChildByName("mcBtColorPicker")))))
            {
                mcbtColorPicker = new btColorPicker();
                mcbtColorPicker.name = "mcBtColorPicker";
                mcbtColorPicker.x = main.Game.ui.mcPopup.mcCustomize.btnClose.x;
                mcbtColorPicker.y = ((main.Game.ui.mcPopup.mcCustomize.btnClose.y + mcbtColorPicker.height) + 3);
                main.Game.ui.mcPopup.mcCustomize.addChild(mcbtColorPicker);
            };
            if ((((!(main.Game.ui.mcPopup.getChildByName("mcCustomizeArmor"))) && (!(main.Game.ui.mcPopup.getChildByName("mcCustomize")))) && (mcbtColorPicker)))
            {
                mcbtColorPicker.destroy();
                mcbtColorPicker = null;
            };
            if (main.Game.ui.mcPopup.currentLabel == "Inventory")
            {
                if (main.Game.ui.mcPopup.getChildByName("mcInventory"))
                {
                    if (main.Game.ui.mcPopup.getChildByName("mcInventory").multiPanel)
                    {
                        if (!MovieClip(main.Game.ui.mcPopup.getChildByName("mcInventory").multiPanel.frames[4].mc).hasEventListener(MouseEvent.MOUSE_WHEEL))
                        {
                            MovieClip(main.Game.ui.mcPopup.getChildByName("mcInventory").multiPanel.frames[4].mc).addEventListener(MouseEvent.MOUSE_WHEEL, onInvWheel, false, 0, true);
                            MovieClip(main.Game.ui.mcPopup.getChildByName("mcInventory").splitPanel.frames[2].mc).addEventListener(MouseEvent.MOUSE_WHEEL, onInvWheel, false, 0, true);
                        };
                    };
                };
            };
            if (main.Game.ui.mcPopup.getChildByName("mcInventory"))
            {
                invBackdrop = MovieClip(main.Game.ui.mcPopup.getChildByName("mcInventory").multiPanel);
                if (flags.isInventory())
                {
                    if (!invBackdrop.getChildByName("invSearch"))
                    {
                        invSearchMC = new invSearch();
                        invSearchMC.name = "invSearch";
                        invBackdrop.addChild(invSearchMC);
                        invSearchMC.x = 32;
                        invSearchMC.y = 12;
                    };
                }
                else
                {
                    if (invBackdrop.getChildByName("invSearch"))
                    {
                        invBackdrop.removeChild(invBackdrop.getChildByName("invSearch"));
                    };
                };
            };
            if (main.Game.ui.mcPopup.currentLabel == "Shop")
            {
                if (main.Game.ui.mcPopup.getChildByName("mcShop"))
                {
                    if (main.Game.ui.mcPopup.getChildByName("mcShop").multiPanel)
                    {
                        if (!MovieClip(main.Game.ui.mcPopup.getChildByName("mcShop").multiPanel.frames[5].mc).hasEventListener(MouseEvent.MOUSE_WHEEL))
                        {
                            MovieClip(main.Game.ui.mcPopup.getChildByName("mcShop").multiPanel.frames[5].mc).addEventListener(MouseEvent.MOUSE_WHEEL, onInvWheel, false, 0, true);
                            MovieClip(main.Game.ui.mcPopup.getChildByName("mcShop").splitPanel.frames[2].mc).addEventListener(MouseEvent.MOUSE_WHEEL, onInvWheel, false, 0, true);
                        };
                    };
                };
            };
            if (main.Game.ui.mcPopup.currentLabel == "MergeShop")
            {
                if (main.Game.ui.mcPopup.getChildByName("mcShop"))
                {
                    if (main.Game.ui.mcPopup.getChildByName("mcShop").mergePanel)
                    {
                        if (!MovieClip(main.Game.ui.mcPopup.getChildByName("mcShop").mergePanel.frames[8].mc).hasEventListener(MouseEvent.MOUSE_WHEEL))
                        {
                            MovieClip(main.Game.ui.mcPopup.getChildByName("mcShop").mergePanel.frames[8].mc).addEventListener(MouseEvent.MOUSE_WHEEL, onInvWheel, false, 0, true);
                        };
                    };
                    drawMergePanel();
                };
            }
            else
            {
                mergeScrollFlag = false;
            };
            if (main.Game.ui.ModalStack.numChildren)
            {
                frame = main.Game.ui.ModalStack.getChildAt(0);
                if (getQualifiedClassName(frame) == "QFrameMC")
                {
                    if (!MovieClip(frame.cnt).hasEventListener(MouseEvent.MOUSE_WHEEL))
                    {
                        MovieClip(frame.cnt).addEventListener(MouseEvent.MOUSE_WHEEL, onQuestWheel, false, 0, true);
                    };
                };
            };
            if (main.Game.ui.mcPopup.currentLabel == "Bank")
            {
                if (((main.Game.ui.mcPopup.getChildByName("mcBank")) && (main.Game.ui.mcPopup.getChildByName("mcBank").bankPanel)))
                {
                    bank = MovieClip(main.Game.ui.mcPopup.getChildByName("mcBank").bankPanel.frames[1].mc);
                    inv = MovieClip(main.Game.ui.mcPopup.getChildByName("mcBank").bankPanel.frames[7].mc);
                    if (!bank.hasEventListener(MouseEvent.MOUSE_WHEEL))
                    {
                        bank.addEventListener(MouseEvent.MOUSE_WHEEL, onBankWheel, false, 0, true);
                    };
                    if (!inv.hasEventListener(MouseEvent.MOUSE_WHEEL))
                    {
                        inv.addEventListener(MouseEvent.MOUSE_WHEEL, onBankWheel, false, 0, true);
                    };
                };
            };
            if (((main.Game.ui.mcPopup.getChildByName("mcCustomizeArmor")) && (!(performOnceFlag))))
            {
                main.Game.ui.mcPopup.mcCustomizeArmor.cpAccessory.addEventListener("ROLL_OVER", onItemRollOver, false, 0, true);
                main.Game.ui.mcPopup.mcCustomizeArmor.cpAccessory.addEventListener("ROLL_OUT", onItemRollOut, false, 0, true);
                performOnceFlag = true;
            }
            else
            {
                if (((performOnceFlag) && (!(main.Game.ui.mcPopup.getChildByName("mcCustomizeArmor")))))
                {
                    performOnceFlag = false;
                };
            };
            if ((((main.Game.ui.mcOFrame.currentLabel == "Idle") && (main.Game.ui.mcOFrame.t1.txtTitle.text == "Friends List")) && (main.Game.ui.mcOFrame.t1.txtTitle.text.indexOf("(") == -1)))
            {
                main.Game.ui.mcOFrame.t1.txtTitle.text = (("Friends List (" + main.Game.world.myAvatar.friends.length) + "/125)");
            };
            if ((((main.Game.ui.mcPopup.currentLabel == "MergeShop") || (main.Game.ui.mcPopup.currentLabel == "Shop")) || (main.Game.ui.mcPopup.currentLabel == "Inventory")))
            {
                drawPreviewInterface();
            };
            if (main.Game.ui.mcPopup.currentLabel == "Bank")
            {
                drawBankFilters();
            };
            if (((main.Game.ui.dropStack.numChildren < 1) || (optionHandler.blackListed.length < 1)))
            {
                return;
            };
            var i:int;
            for (;i < main.Game.ui.dropStack.numChildren;(i = (i + 1)))
            {
                try
                {
                    if (!main.Game.ui.dropStack.getChildAt(i))
                    {
                        continue;
                    };
                    mcDrop = (main.Game.ui.dropStack.getChildAt(i) as MovieClip);
                    if (((main.Game.ui.dropStack.getChildAt(i).cnt) && (main.Game.ui.dropStack.getChildAt(i).cnt.strName)))
                    {
                        if (isBlacklisted(mcDrop.cnt.strName.text.toUpperCase()))
                        {
                            mcDrop.cnt.nbtn.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
                        };
                    };
                }
                catch(exception)
                {
                    trace(("Error handling drops: " + exception));
                };
            };
        }

        public static function drawBankFilters():void
        {
            if (!main.Game.ui.mcPopup.getChildByName("mcBank"))
            {
                return;
            };
            var mcFocus:MovieClip = MovieClip(main.Game.ui.mcPopup.getChildByName("mcBank")).bankPanel.frames[8].mc;
            if (mcFocus.getChildByName("bankFiltersMC"))
            {
                return;
            };
            mcFocus.ti.visible = false;
            var bankfiltersMC:bankfilters = new bankfilters();
            mcFocus.addChild(bankfiltersMC);
            bankfiltersMC.y = (bankfiltersMC.y + 5);
            bankfiltersMC.name = "bankFiltersMC";
        }

        public static function drawMergePanel():void
        {
            var t_mc:MovieClip;
            var t_scrollMC:MovieClip;
            var maskMC:Shape;
            var scrollMC:mergeScroll;
            var t2_mc:MovieClip;
            if (((main.Game.ui.mcPopup.getChildByName("mcShop").iSel) && (main.Game.ui.mcPopup.getChildByName("mcShop").mergePanel)))
            {
                if (((main.Game.ui.mcPopup.getChildByName("mcShop").mergePanel.frames[10].mc.iList.height >= 208.4) && (!(mergeScrollFlag))))
                {
                    t_mc = main.Game.ui.mcPopup.getChildByName("mcShop").mergePanel.frames[10].mc;
                    t_mc.bg.height = 186;
                    if (!t_mc.getChildByName("maskMC"))
                    {
                        maskMC = new Shape();
                        maskMC.graphics.beginFill(0);
                        maskMC.graphics.drawRect(0, 0, t_mc.bg.width, t_mc.bg.height);
                        maskMC.graphics.endFill();
                        t_mc.addChild(maskMC);
                        maskMC.name = "maskMC";
                        maskMC.x = t_mc.bg.x;
                        maskMC.y = t_mc.bg.y;
                        t_mc.iList.mask = maskMC;
                        scrollMC = new mergeScroll();
                        t_mc.addChild(scrollMC);
                        scrollMC.name = "scrollMC";
                        scrollMC.x = ((t_mc.bg.x + t_mc.bg.width) - (scrollMC.width / 2));
                        scrollMC.y = (t_mc.bg.y + 5);
                        scrollMC.height = (t_mc.bg.height - 10);
                        scrollMC.h.height = (scrollMC.h.height / 2);
                    }
                    else
                    {
                        t_mc.getChildByName("maskMC").height = t_mc.bg.height;
                        t_mc.getChildByName("maskMC").width = t_mc.bg.width;
                        t_mc.getChildByName("maskMC").x = t_mc.bg.x;
                        t_mc.getChildByName("maskMC").y = t_mc.bg.y;
                        t_mc.getChildByName("scrollMC").visible = true;
                        t_mc.getChildByName("scrollMC").x = ((t_mc.bg.x + t_mc.bg.width) - (t_mc.getChildByName("scrollMC").width / 2));
                        t_mc.getChildByName("scrollMC").y = (t_mc.bg.y + 5);
                        t_mc.getChildByName("scrollMC").height = (t_mc.bg.height - 10);
                    };
                    t_scrollMC = MovieClip(t_mc.getChildByName("scrollMC"));
                    hRun = (t_scrollMC.b.height - t_scrollMC.h.height);
                    dRun = (((int((t_mc.iList.height + (t_mc.iList.y * 2))) + 1) - t_mc.getChildByName("maskMC").height) + 5);
                    t_scrollMC.h.y = 0;
                    t_mc.iList.oy = t_mc.iList.y;
                    t_scrollMC.hit.alpha = 0;
                    mDown = false;
                    t_scrollMC.hit.addEventListener(MouseEvent.MOUSE_DOWN, merge_scrDown, false, 0, true);
                    t_scrollMC.h.addEventListener(Event.ENTER_FRAME, merge_hEF, false, 0, true);
                    t_mc.iList.addEventListener(Event.ENTER_FRAME, merge_dEF, false, 0, true);
                    t_mc.ti.y = (t_mc.bg.height + 2);
                    cachedItem = main.Game.ui.mcPopup.getChildByName("mcShop").iSel.ItemID;
                    t_mc.addEventListener(MouseEvent.MOUSE_WHEEL, onMergeBoxScroll, false, 0, true);
                    mergeScrollFlag = true;
                }
                else
                {
                    if (((mergeScrollFlag) && (!(main.Game.ui.mcPopup.getChildByName("mcShop").iSel.ItemID == cachedItem))))
                    {
                        t2_mc = main.Game.ui.mcPopup.getChildByName("mcShop").mergePanel.frames[10].mc;
                        if (t2_mc.getChildByName("scrollMC"))
                        {
                            t2_mc.getChildByName("scrollMC").visible = false;
                            MovieClip(t2_mc.getChildByName("scrollMC")).hit.removeEventListener(MouseEvent.MOUSE_DOWN, merge_scrDown);
                            MovieClip(t2_mc.getChildByName("scrollMC")).h.removeEventListener(Event.ENTER_FRAME, merge_hEF);
                        };
                        t2_mc.iList.y = 0;
                        t2_mc.iList.removeEventListener(Event.ENTER_FRAME, merge_dEF);
                        t2_mc.removeEventListener(MouseEvent.MOUSE_WHEEL, onMergeBoxScroll);
                        t2_mc.bg.height = (t2_mc.iList.height + 1);
                        t2_mc.ti.y = (t2_mc.bg.height + 2);
                        mergeScrollFlag = false;
                        cachedItem = -1;
                    };
                };
            };
        }

        public static function drawPreviewInterface():void
        {
            var mcFocus:MovieClip;
            var mcTarget:String;
            var mcUI:MovieClip;
            var btGenderMC:*;
            var btSetMountMC:*;
            var tryMeMC:*;
            var t_showBt:*;
            switch (main.Game.ui.mcPopup.currentLabel)
            {
                case "Shop":
                    if (!main.Game.ui.mcPopup.getChildByName("mcShop"))
                    {
                        mcTarget = "None";
                        break;
                    };
                    mcFocus = MovieClip(main.Game.ui.mcPopup.getChildByName("mcShop")).previewPanel.getChildAt(3);
                    mcTarget = ((MovieClip(main.Game.ui.mcPopup.getChildByName("mcShop")).previewPanel.visible) ? "mcShop" : "None");
                    break;
                case "MergeShop":
                    if (!main.Game.ui.mcPopup.getChildByName("mcShop"))
                    {
                        mcTarget = "None";
                        break;
                    };
                    mcFocus = MovieClip(main.Game.ui.mcPopup.getChildByName("mcShop")).mergePanel.getChildAt(3);
                    mcTarget = ((MovieClip(main.Game.ui.mcPopup.getChildByName("mcShop")).mergePanel.visible) ? "mcShop" : "None");
                    break;
                case "Inventory":
                    if (!main.Game.ui.mcPopup.getChildByName("mcInventory"))
                    {
                        mcTarget = "None";
                        break;
                    };
                    mcFocus = MovieClip(main.Game.ui.mcPopup.getChildByName("mcInventory")).previewPanel.getChildAt(3);
                    mcTarget = ((MovieClip(main.Game.ui.mcPopup.getChildByName("mcInventory")).previewPanel.visible) ? "mcInventory" : "None");
                    break;
                default:
                    mcTarget = "None";
            };
            mcUI = main.Game.ui.mcPopup.getChildByName(mcTarget);
            if (((!((mcTarget == "None") || (!(mcUI)))) && (!(f_itemsDrawn))))
            {
                f_itemsDrawn = true;
                f_savedISel = mcUI.iSel.ItemID;
                if (mcFocus.tInfo.textHeight > mcFocus.tInfo.height)
                {
                    mcUI.iSel.sDesc = StringUtil.trim(mcUI.iSel.sDesc);
                    mcFocus.tInfo.htmlText = main.Game.getItemInfoStringB(mcUI.iSel);
                    if (mcFocus.tInfo.textHeight >= 109.8)
                    {
                        mcFocus.tInfo.y = int(((mcFocus.btnDelete.y + mcFocus.btnDelete.height) - (mcFocus.tInfo.height - (((mcFocus.tInfo.textHeight == 109.8) || (mcFocus.tInfo.textHeight == 122.95)) ? 15 : 3))));
                    };
                };
                if (isGender(mcTarget))
                {
                    if (!mcFocus.getChildByName("btGender"))
                    {
                        btGenderMC = new btGender();
                        btGenderMC.name = "btGender";
                        btGenderMC.height = 22;
                        btGenderMC.width = 26;
                        mcFocus.addChild(btGenderMC);
                    };
                    if ((((main.Game.ui.mcPopup.currentLabel == "Shop") && (mcUI.previewPanel.visible)) && (!(mcUI.splitPanel.visible))))
                    {
                        mcFocus.getChildByName("btGender").x = 0xFF;
                        mcFocus.getChildByName("btGender").y = 175;
                    }
                    else
                    {
                        if (main.Game.ui.mcPopup.currentLabel == "MergeShop")
                        {
                            mcFocus.getChildByName("btGender").x = 0xFF;
                            mcFocus.getChildByName("btGender").y = 175;
                        }
                        else
                        {
                            if (((main.Game.ui.mcPopup.currentLabel == "Inventory") && (!(mcUI.splitPanel.visible))))
                            {
                                mcFocus.getChildByName("btGender").x = 252;
                                mcFocus.getChildByName("btGender").y = 150;
                            };
                        };
                    };
                }
                else
                {
                    if (mcFocus.getChildByName("btGender"))
                    {
                        mcFocus.removeChild(mcFocus.getChildByName("btGender"));
                    };
                };
                if (((optionHandler.bBetterMounts) && (isMount())))
                {
                    if (!mcFocus.getChildByName("btSetMount"))
                    {
                        btSetMountMC = new btSetMount();
                        btSetMountMC.name = "btSetMount";
                        btSetMountMC.height = 22;
                        btSetMountMC.width = 26;
                        mcFocus.addChild(btSetMountMC);
                    };
                    if (((main.Game.ui.mcPopup.currentLabel == "Inventory") && (!(mcUI.splitPanel.visible))))
                    {
                        mcFocus.getChildByName("btSetMount").x = 252;
                        mcFocus.getChildByName("btSetMount").y = 127;
                    };
                }
                else
                {
                    if (mcFocus.getChildByName("btSetMount"))
                    {
                        mcFocus.removeChild(mcFocus.getChildByName("btSetMount"));
                    };
                };
                if (isPreviewable())
                {
                    if (!mcFocus.getChildByName("tryMe"))
                    {
                        tryMeMC = new tryMe();
                        tryMeMC.name = "tryMe";
                        mcFocus.addChild(tryMeMC);
                    };
                    if ((((main.Game.ui.mcPopup.currentLabel == "Shop") && (mcUI.previewPanel.visible)) && (!(mcUI.splitPanel.visible))))
                    {
                        mcFocus.getChildByName("tryMe").x = 17;
                        mcFocus.getChildByName("tryMe").y = 333;
                    };
                    if ((main.Game.ui.mcPopup.currentLabel == "MergeShop"))
                    {
                        mcFocus.getChildByName("tryMe").x = 165;
                        mcFocus.getChildByName("tryMe").y = 293;
                        MovieClip(main.Game.ui.mcPopup.getChildByName("mcShop")).mergePanel.frames[3].mc.mouseEnabled = (MovieClip(main.Game.ui.mcPopup.getChildByName("mcShop")).mergePanel.frames[3].mc.mouseChildren = false);
                    };
                }
                else
                {
                    if (mcFocus.getChildByName("tryMe"))
                    {
                        mcFocus.removeChild(mcFocus.getChildByName("tryMe"));
                    };
                };
                if (isShowable())
                {
                    MovieClip(main.Game.ui.mcPopup.getChildByName("mcInventory")).previewPanel.frames[5].mc.visible = false;
                    if (!mcFocus.getChildByName("showBt"))
                    {
                        t_showBt = new showBt();
                        t_showBt.name = "showBt";
                        t_showBt.x = 28;
                        t_showBt.y = 336;
                        mcFocus.addChild(t_showBt);
                    }
                    else
                    {
                        if (mcFocus.getChildByName("showBt"))
                        {
                            MovieClip(mcFocus.getChildByName("showBt")).bt_update();
                        };
                    };
                }
                else
                {
                    if (mcFocus.getChildByName("showBt"))
                    {
                        mcFocus.removeChild(mcFocus.getChildByName("showBt"));
                    };
                };
            }
            else
            {
                if (f_itemsDrawn)
                {
                    if (mcUI)
                    {
                        if (((mcUI.iSel) && (!(f_savedISel == mcUI.iSel.ItemID))))
                        {
                            f_itemsDrawn = false;
                            f_savedISel = 0;
                        };
                    }
                    else
                    {
                        if (mcTarget == "None")
                        {
                            f_itemsDrawn = false;
                            f_savedISel = 0;
                        };
                    };
                };
            };
        }

        public static function isBlacklisted(item:String):Boolean
        {
            var blacklisted:*;
            for each (blacklisted in optionHandler.blackListed)
            {
                if (item.indexOf(" X") != -1)
                {
                    item = item.substring(0, item.lastIndexOf(" X"));
                };
                if (StringUtil.trim(item) == StringUtil.trim(blacklisted.label))
                {
                    return (true);
                };
            };
            return (false);
        }

        public static function onMaintainTimer(e:TimerEvent):void
        {
            var _module:*;
            var faction:*;
            if (((!(main.Game)) || (!(main.Game.ui))))
            {
                return;
            };
            for each (_module in moduleList)
            {
                if (_module.moduleType == "Timer")
                {
                    _module.moduleClass.onTimerUpdate();
                };
            };
            if (((optionHandler.cleanRep) && (!(main.Game.world.myAvatar.factions.hasOwnProperty("cleaned")))))
            {
                for each (faction in main.Game.world.myAvatar.factions)
                {
                    if (faction.iRank == "10")
                    {
                        faction.iSpillRep = 0;
                    };
                    if (((faction.sName == "Blacksmithing") && (faction.iRank == "4")))
                    {
                        faction.iSpellRep = 0;
                        faction.iRepToRank = 0;
                        faction.iRank = "10";
                    };
                };
                main.Game.world.myAvatar.factions.cleaned = true;
            };
            if (main.Game.world.myAvatar)
            {
                if (main.Game.world.myAvatar.target)
                {
                    if (main.Game.world.myAvatar.target.dataLeaf.intState == 0)
                    {
                        main.Game.world.myAvatar.pMC.clearQueue();
                    };
                };
            };
            if (!main.Game.ui.mcInterface.mcGold.getChildByName("mcAC"))
            {
                t_mcAC = new mcAC();
                main.Game.ui.mcInterface.mcGold.addChild(t_mcAC);
                t_mcAC.name = "mcAC";
                t_mcAC.visible = false;
                main.Game.ui.mcInterface.mcGold.addEventListener(MouseEvent.ROLL_OVER, onMcGoldMouseOver, false, 0, true);
                main.Game.ui.mcInterface.mcGold.addEventListener(MouseEvent.ROLL_OUT, onMcGoldMouseOut, false, 0, true);
            };
        }

        public static function onItemRollOver(param1:Event):void
        {
            var _loc2_:* = new Object();
            var avt:* = main.Game.world.myAvatar;
            _loc2_.intColorSkin = avt.objData.intColorSkin;
            _loc2_.intColorHair = avt.objData.intColorHair;
            _loc2_.intColorEye = avt.objData.intColorEye;
            _loc2_.intColorBase = avt.objData.intColorBase;
            _loc2_.intColorTrim = avt.objData.intColorTrim;
            _loc2_.intColorAccessory = param1.target.selectedColor;
            avt.pMC.updateColor(_loc2_);
        }

        public static function onItemRollOut(param1:Event):void
        {
            main.Game.world.myAvatar.pMC.updateColor();
        }

        public static function onExtensionResponseHandler(e:*):void
        {
            var _module:*;
            var dID:*;
            var protocol:*;
            var resObj:*;
            var cmd:*;
            if (((!(main.Game)) || (!(main.Game.ui))))
            {
                return;
            };
            for each (_module in moduleList)
            {
                if (_module.responseHandler == true)
                {
                    _module.moduleClass.onExtensionResponseHandler(e);
                };
            };
            protocol = e.params.type;
            if (protocol == "json")
            {
                resObj = e.params.dataObj;
                cmd = resObj.cmd;
                switch (cmd)
                {
                    case "bookInfo":
                        if (optionHandler.alphaBOL)
                        {
                            main.Game.world.bookData.HMBadge.sortOn("strName");
                            main.Game.world.bookData.OBadge.sortOn("strName");
                            main.Game.world.bookData.AchBadge.sortOn("strName");
                        };
                        break;
                };
            };
        }

        public static function onMaintainKeys(e:*):void
        {
            var _module:*;
            if (((!(main.Game)) || (!(main.Game.ui))))
            {
                return;
            };
            for each (_module in moduleList)
            {
                if (_module.keyHandler == true)
                {
                    _module.moduleClass.onKey(e);
                };
            };
            if (main.Game.ui.getChildByName("travelMenuMC"))
            {
                if (!("text" in e.target))
                {
                    if (String.fromCharCode(e.charCode) == "t")
                    {
                        main.Game.ui.getChildByName("travelMenuMC").dispatchTravel();
                    };
                };
            };
            if (optionHandler.bBetterMounts)
            {
                if (!("text" in e.target))
                {
                    if (String.fromCharCode(e.charCode) == "m")
                    {
                        main.Game.ui.mcPortrait.getChildByName("iconMount").dispatchMount();
                    };
                };
            };
        }
    }
}
