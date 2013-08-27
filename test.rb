class Playlist
  attr_accessor :name, :author, :current_song, :next
  attr_reader :song_list, :history
  
  def create_playlist(array)
    @song_index = 0
    @song_list = array
    @history = []
    if @song_index < @song_list.length
      @history << @song_list[@song_index]
      @current_song = @song_list[@song_index]
      @song_index.next
    else
      creat_playlist
    end
  end
  
  def next
      #@history << @song_list[@song_index]
      @song_index += 1
  end
end


require 'rspec/autorun'
describe "Playlist" do
  describe "instance variables" do
    it "should have song_list as read only" do
      p = Playlist.new
      p.respond_to?(:song_list).should eq(true)
      p.respond_to?(:song_list=).should eq(false)
    end
    it "should have history as read only" do
      p = Playlist.new
      p.respond_to?(:history).should eq(true)
      p.respond_to?(:history=).should eq(false)
    end
    it "shouldn't have song_index accessible" do
      p = Playlist.new
      p.respond_to?(:song_index).should eq(false)
      p.respond_to?(:song_index=).should eq(false)
    end
  end
  describe "create_playlist" do
    it "should take a new list of songs" do
      p = Playlist.new
      p.create_playlist(["a", "b", "c"])
      p.song_list.should eq(["a", "b", "c"])
    end
    it "should add first song to history" do
      p = Playlist.new
      p.create_playlist(["a", "b", "c"])
      p.history.should eq(["a"])
    end
    it "should overwrite previous history" do
      p = Playlist.new
      p.create_playlist(["m", "n", "o"])
      p.history.should eq(["m"])
      p.create_playlist(["x", "y", "z"])
      p.history.should eq(["x"])
    end
  end
  describe "next" do
    it "should add next song to history" do
      p = Playlist.new
      p.create_playlist(["d", "e", "f"])
      p.history.should eq(["d"])
      p.next
      p.history.should eq(["d","e"])
    end
    it "should repeat the playlist, adding it to the history" do
      p = Playlist.new
      p.create_playlist(["m", "n", "o"])
      p.next
      p.next
      p.next
      p.next
      p.history.should eq(["m", "n", "o", "m", "n"])
    end
  end
  describe "current_song" do
    it "should be the first song when a playlist is created" do
      p = Playlist.new
      p.create_playlist(["g", "h", "i"])
      p.current_song.should eq("g")
    end
    it "should be the next song after next is called" do
      p = Playlist.new
      p.create_playlist(["g", "h", "i"])
      p.next
      p.current_song.should eq("h")
    end
  end
end