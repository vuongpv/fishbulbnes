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
    
    private Gtk.VPaned vpaned1;
    
    private Gtk.Frame frame3;
    
    private Gtk.Alignment GtkAlignment2;
    
    private Gtk.Button button1;
    
    private Gtk.Label GtkLabel3;
    
    private Gtk.Frame frame4;
    
    private Gtk.Alignment GtkAlignment3;
    
    private Gtk.Label GtkLabel2;
    
    protected virtual void Build() {
        Stetic.Gui.Initialize(this);
        // Widget MainWindow
        this.Name = "MainWindow";
        this.Title = Mono.Unix.Catalog.GetString("MainWindow");
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
        this.btnLoadRom.Label = Mono.Unix.Catalog.GetString("Load");
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
        this.vpaned1 = new Gtk.VPaned();
        this.vpaned1.CanFocus = true;
        this.vpaned1.Name = "vpaned1";
        this.vpaned1.Position = 77;
        // Container child vpaned1.Gtk.Paned+PanedChild
        this.frame3 = new Gtk.Frame();
        this.frame3.Name = "frame3";
        this.frame3.ShadowType = ((Gtk.ShadowType)(0));
        // Container child frame3.Gtk.Container+ContainerChild
        this.GtkAlignment2 = new Gtk.Alignment(0F, 0F, 1F, 1F);
        this.GtkAlignment2.Name = "GtkAlignment2";
        this.GtkAlignment2.LeftPadding = ((uint)(12));
        // Container child GtkAlignment2.Gtk.Container+ContainerChild
        this.button1 = new Gtk.Button();
        this.button1.CanFocus = true;
        this.button1.Name = "button1";
        this.button1.UseUnderline = true;
        this.button1.Label = Mono.Unix.Catalog.GetString("button1");
        this.GtkAlignment2.Add(this.button1);
        this.frame3.Add(this.GtkAlignment2);
        this.GtkLabel3 = new Gtk.Label();
        this.GtkLabel3.Name = "GtkLabel3";
        this.GtkLabel3.LabelProp = Mono.Unix.Catalog.GetString("<b>frame2</b>");
        this.GtkLabel3.UseMarkup = true;
        this.frame3.LabelWidget = this.GtkLabel3;
        this.vpaned1.Add(this.frame3);
        Gtk.Paned.PanedChild w7 = ((Gtk.Paned.PanedChild)(this.vpaned1[this.frame3]));
        w7.Resize = false;
        // Container child vpaned1.Gtk.Paned+PanedChild
        this.frame4 = new Gtk.Frame();
        this.frame4.Name = "frame4";
        this.frame4.ShadowType = ((Gtk.ShadowType)(0));
        // Container child frame4.Gtk.Container+ContainerChild
        this.GtkAlignment3 = new Gtk.Alignment(0F, 0F, 1F, 1F);
        this.GtkAlignment3.Name = "GtkAlignment3";
        this.GtkAlignment3.LeftPadding = ((uint)(12));
        this.frame4.Add(this.GtkAlignment3);
        this.GtkLabel2 = new Gtk.Label();
        this.GtkLabel2.Name = "GtkLabel2";
        this.GtkLabel2.LabelProp = Mono.Unix.Catalog.GetString("<b>frame3</b>");
        this.GtkLabel2.UseMarkup = true;
        this.frame4.LabelWidget = this.GtkLabel2;
        this.vpaned1.Add(this.frame4);
        this.hbox1.Add(this.vpaned1);
        Gtk.Box.BoxChild w10 = ((Gtk.Box.BoxChild)(this.hbox1[this.vpaned1]));
        w10.Position = 2;
        w10.Expand = false;
        w10.Fill = false;
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