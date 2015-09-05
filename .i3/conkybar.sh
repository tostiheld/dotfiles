#!/bin/sh

# send json to let i3bar identify
# that we are going to send json
echo '{"version":1}'
echo '['
echo '[],'

exec conky -c $HOME/.i3/conkyrc
