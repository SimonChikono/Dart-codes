class Song {
  String title;
  String artist;
  int length;

  Song(this.title, this.artist, this.length);

  @override
  String toString() {
    return 'Title: $title, Artist: $artist, Length: $length';
  }
}

class SongDatabase {
  List<Song> _songs;

  SongDatabase() {
    _songs = [
      Song('Bohemian Rhapsody', 'Queen', 354),
      Song('Stairway to Heaven', 'Led Zeppelin', 482),
      Song('Hotel California', 'The Eagles', 390),
      Song('Smells Like Teen Spirit', 'Nirvana', 301),
      Song('Billie Jean', 'Michael Jackson', 292),
    ];
  }

  Song findByIndex(int index) {
    if (index >= 0 && index < _songs.length) {
      return _songs[index];
    } else {
      return null;
    }
  }

  Song findByTitle(String title) {
    for (var song in _songs) {
      if (song.title == title) {
        return song;
      }
    }
    return null;
  }

  List<Song> findByArtist(String artist) {
    var matchingSongs = <Song>[];
    for (var song in _songs) {
      if (song.artist == artist) {
        matchingSongs.add(song);
      }
    }
    return matchingSongs;
  }

  void removeSong(Song song) {
    _songs.remove(song);
  }

  void addSong(Song song) {
    _songs.add(song);
  }
}

void main() {
  var database = SongDatabase();

  // Find by index
  var song1 = database.findByIndex(2);
  print('Song at index 2: $song1');

  // Find by title
  var song2 = database.findByTitle('Billie Jean');
  print('Song by title: $song2');

  // Find by artist
  var songsByQueen = database.findByArtist('Queen');
  print('Songs by Queen: $songsByQueen');

  // Remove song
  var song3 = database.findByTitle('Hotel California');
  database.removeSong(song3);
  print('Removed song: $song3');

  // Add song
  var newSong = Song('New Song', 'New Artist', 180);
  database.addSong(newSong);
  print('Added song: $newSong');
}
