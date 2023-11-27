#!/usr/bin/ruby
require 'gtk3'

def nextwin
  win1=Gtk::Window.new("XFDM")
  win1.set_size_request(100,100)
  win1.show_all
  %x{ startxfce4 }
end

win=Gtk::Window.new("XFDM")

scn=Gdk::Screen.default
#label=Gtk::Label.new("")
#space=Gtk::Label.new("  ")
#comma=Gtk::Entry.new
# Add dynamic username instead of "current account"
button=Gtk::Button.new(label: "Start Xfce4 Session (Current account)")
button.signal_connect('clicked') do
  win.destroy
  nextwin
end
win.set_size_request(scn.width, scn.height)
win.set_border_width(200)

grid=Gtk::Grid.new
grid.attach(button, 0, 5, 5, 5)
win.add(grid)

win.show_all
Gtk.main
