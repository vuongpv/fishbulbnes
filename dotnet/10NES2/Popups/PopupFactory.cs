﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using InstiBulb.ThreeDee;
using System.Windows;

namespace InstiBulb.Popups
{
    public class PopupFactory
    {
        Window mainWindow;
        PopupPanel panel;

        public PopupFactory(Window mainWindow, PopupPanel panel)
        {
            this.mainWindow = mainWindow;
            this.panel = panel;
        }

        public Icon3D OwnerIcon
        {
            get;
            set;
        }

        public Window CreateWindow(UIElement content)
        {
            Window w =  new Window();
            w.Width = 480;
            w.Height = 680;
            w.Owner = mainWindow;
            w.Content = content;
            return w;
        }

        public void UpdatePopupControl()
        {
            //panel.Child = currentIcon.GetContent();
        }
    }
}
