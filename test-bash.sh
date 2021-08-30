newline="\n"
changelog="Changelog:"
commits=$(PAGER=cat git log 206793dfd3d863d484851f4b7fae0e87cd87a8f0..2295dd98eb55faf22736cbbbb0e5e6534c2b3a63 --oneline --decorate=no)
after_steps=$(cat pr-body.txt)
body=$changelog$newline$commits$newline$after_steps

echo $body