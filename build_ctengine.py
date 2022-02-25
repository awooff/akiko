#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import os, sys
if __name__ == '__main__':
  ctng = './engines/ctengine-rs/'  # CTEngine-rs
  if os.path.isdir(ctng):
    try:
      os.system(f'cd {ctng} && cargo b --release')
      if os.system(f'cd {ctng} && bundle install') != 0:
        print('you got a weird error fuck.')
        sys.exit(127)
      print(':)')
    except RuntimeError:
      print('oh noes you got a fucky wucky!! read the output here')
    os.system(f'cd {ctng} && cargo r --release')
    sys.exit(0)
  else:
    print('did you clone the repo properly you fucking retard')
    sys.exit(404)
    