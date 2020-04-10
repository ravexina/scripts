#!/usr/bin/env python3

import dbus

try:
	session_bus = dbus.SessionBus()

	clementine = session_bus.get_object('org.mpris.MediaPlayer2.clementine', '/org/mpris/MediaPlayer2')
	props = dbus.Interface(clementine, dbus_interface='org.freedesktop.DBus.Properties')

	metadata = props.Get('org.mpris.MediaPlayer2.Player', 'Metadata')

	try:
		album = str(metadata['xesam:album'])
	except:
		album = ''

	artist = str(metadata['xesam:artist'][0])
	title = str(metadata['xesam:title'])

	# Fix some titles issues
	artist = artist.replace("'", '')
	title = title.replace('&', 'And')
	title = title.replace("'", '')

	now_playing = title + ' (' + artist + ')'
except:
	now_playing = '.:: ♪♪♪ ::..'

print(now_playing)

