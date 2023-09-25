import 'package:flutter/material.dart';
import 'package:lesson_4_musik_collection/home_page.dart';

void main(List<String> arguments) {
  final playlist1 = PlayList(playListName: 'first');
  playlist1.addSong(Song(
      songName: 'Song1',
      performerName: 'Performer1',
      year: 1990,
      duration: Duration(minutes: 4, seconds: 10)));
  playlist1.addSong(Song(
      songName: 'Song2',
      performerName: 'Performer1',
      year: 1991,
      duration: Duration(minutes: 4, seconds: 20)));
  playlist1.addSong(Song(
      songName: 'Song3',
      performerName: 'Performer3',
      year: 1992,
      duration: Duration(minutes: 4, seconds: 30)));
  playlist1.addSong(Song(
      songName: 'Song4',
      performerName: 'Performer4',
      year: 1994,
      duration: Duration(minutes: 4, seconds: 40)));
  playlist1.addSong(Song(
      songName: 'Song5',
      performerName: 'Performer5',
      year: 1995,
      duration: Duration(minutes: 4, seconds: 50)));
  playlist1.addSong(Song(
      songName: 'Song6',
      performerName: 'Performer1',
      year: 1996,
      duration: Duration(minutes: 6, seconds: 10)));
  playlist1.addSong(Song(
      songName: 'Song7',
      performerName: 'Performer7',
      year: 1997,
      duration: Duration(minutes: 4, seconds: 30)));
  playlist1.addSong(Song(
      songName: 'Song8',
      performerName: 'Performer8',
      year: 1998,
      duration: Duration(minutes: 3, seconds: 10)));
  playlist1.addSong(Song(
      songName: 'Song9',
      performerName: 'Performer9',
      year: 1999,
      duration: Duration(minutes: 2, seconds: 10)));

  print(
      'Total duration of playlist ${playlist1.playListName}) is ${(playlist1.songList.totalDurations())} seconds');
  final resultsOfSearch = playlist1.search('Performer1');
  print(
      'Here is a list of songs name filtered by performer: ${resultsOfSearch.map((song) => song.songName).join(', ')}');
  print(
      'Here is a duration of songs filtered by performer: ${resultsOfSearch.totalDurations()}');
}

class Song {
  final String songName;
  final String performerName;
  final int year;
  final Duration duration;

  Song(
      {required this.songName,
        required this.performerName,
        required this.year,
        required this.duration});
}

class PlayList with SearchMixin {
  final String playListName;

  PlayList({required this.playListName});
  void addSong(Song song) => songList.add(song);
}

mixin SearchMixin {
  final List<Song> songList = [];

  List<Song> search(String name) => songList
      .where((song) =>
  song.songName.toLowerCase().contains(name.toLowerCase()) ||
      song.performerName.toLowerCase().contains(name.toLowerCase()))
      .toList();
}

extension TotalDurationPlaylistExtension on List<Song> {
  Duration totalDurations() {
    int totalTime = 0;
    for (Song song in this) {
      totalTime = totalTime + song.duration.inSeconds;
    }
    return Duration(seconds: totalTime);
  }
}

