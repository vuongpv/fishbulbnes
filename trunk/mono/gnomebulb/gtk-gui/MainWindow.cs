// ------------------------------------------------------------------------------
//  <autogenerated>
//      This code was generated by a tool.
//      
// 
//      Changes to this file may cause incorrect behavior and will be lost if 
//      the code is regenerated.
//  </autogenerated>
// ------------------------------------------------------------------------------



public partial class MainWindow {
    
    private Gtk.Frame frame1;
    
    private Gtk.Alignment GtkAlignment;
    
    private Gtk.HBox hbox1;
    
    private Gtk.Button btnLoadRom;
    
    private Gtk.Frame frame2;
    
    private Gtk.Alignment GtkAlignment1;
    
    private Gtk.GLWidget glwidget2;
    
    private Gtk.VPaned controlPanel;
    
    protected virtual void Build() {
        Stetic.Gui.Initialize(this);
        // Widget MainWindow
        this.Name = "MainWindow";
        this.Title = "MainWindow";
        this.WindowPosition = ((Gtk.WindowPosition)(4));
        // Container child MainWindow.Gtk.Container+ContainerChild
        this.frame1 = new Gtk.Frame();
        this.frame1.Name = "frame1";
        this.frame1.ShadowType = ((Gtk.ShadowType)(0));
        // Container child frame1.Gtk.Container+ContainerChild
        this.GtkAlignment = new Gtk.Alignment(0F, 0F, 1F, 1F);
        this.GtkAlignment.Name = "GtkAlignment";
        this.GtkAlignment.LeftPadding = ((uint)(12));
        // Container child GtkAlignment.Gtk.Container+ContainerChild
        this.hbox1 = new Gtk.HBox();
        this.hbox1.Name = "hbox1";
        this.hbox1.Spacing = 6;
        // Container child hbox1.Gtk.Box+BoxChild
        this.btnLoadRom = new Gtk.Button();
        this.btnLoadRom.CanFocus = true;
        this.btnLoadRom.Name = "btnLoadRom";
        this.btnLoadRom.UseUnderline = true;
        this.btnLoadRom.Label = "Load";
        this.hbox1.Add(this.btnLoadRom);
        Gtk.Box.BoxChild w1 = ((Gtk.Box.BoxChild)(this.hbox1[this.btnLoadRom]));
        w1.Position = 0;
        w1.Expand = false;
        w1.Fill = false;
        // Container child hbox1.Gtk.Box+BoxChild
        this.frame2 = new Gtk.Frame();
        this.frame2.Name = "frame2";
        this.frame2.ShadowType = ((Gtk.ShadowType)(0));
        // Container child frame2.Gtk.Container+ContainerChild
        this.GtkAlignment1 = new Gtk.Alignment(0F, 0F, 1F, 1F);
        this.GtkAlignment1.Name = "GtkAlignment1";
        this.GtkAlignment1.LeftPadding = ((uint)(12));
        // Container child GtkAlignment1.Gtk.Container+ContainerChild
        this.glwidget2 = new Gtk.GLWidget();
        this.glwidget2.Name = "glwidget2";
        this.glwidget2.DoubleBuffered = true;
        this.glwidget2.ColorBits = 24;
        this.glwidget2.AlphaBits = 8;
        this.glwidget2.DepthBits = 0;
        this.glwidget2.StencilBits = 0;
        this.GtkAlignment1.Add(this.glwidget2);
        this.frame2.Add(this.GtkAlignment1);
        this.hbox1.Add(this.frame2);
        Gtk.Box.BoxChild w4 = ((Gtk.Box.BoxChild)(this.hbox1[this.frame2]));
        w4.Position = 1;
        // Container child hbox1.Gtk.Box+BoxChild
        this.controlPanel = new Gtk.VPaned();
        this.controlPanel.CanFocus = true;
        this.controlPanel.Name = "controlPanel";
        this.controlPanel.Position = 23;
        this.hbox1.Add(this.controlPanel);
        Gtk.Box.BoxChild w5 = ((Gtk.Box.BoxChild)(this.hbox1[this.controlPanel]));
        w5.Position = 2;
        this.GtkAlignment.Add(this.hbox1);
        this.frame1.Add(this.GtkAlignment);
        this.Add(this.frame1);
        if ((this.Child != null)) {
            this.Child.ShowAll();
        }
        this.DefaultWidth = 400;
        this.DefaultHeight = 300;
        this.Show();
        this.DeleteEvent += new Gtk.DeleteEventHandler(this.OnDeleteEvent);
    }
}
