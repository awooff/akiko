#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import os, sys
if __name__ == '__main__':
  if os.path.isdir('./engines/ctengine-rs/'):
    try:
      os.system('cd engines/ctengine-rs && cargo b --release')
      print(':)')
    except RuntimeError:
      print('oh noes you got a fucky wucky!! read the output here')
    os.system('cd ./engines/ctengine-rs && cargo r --release')
    sys.exit(0)
  else:
    print('did you clone the repo properly you fucking retard')
    sys.exit(404)
    