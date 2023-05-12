require "clim"

module Akiko
  class Cli < Clim
    main do
      desc "Akiko CLI tool."
      usage "akiko [options] [arguments] ..."
      version "Version 0.1.0"
      option "-g WORDS", "--greeting=WORDS", type: String, desc: "Words of greetings.", default: "Akiko"
      argument "first_member", type: String, desc: "first member name.", default: "member1"
      argument "second_member", type: String, desc: "second member name.", default: "member2"
      run do |opts, args|
        print "#{opts.greeting}, "
        print "#{args.first_member} & #{args.second_member} !\n"
        print "And #{args.unknown_args.join(", ")} !"
        print "\n"
      end
    end
  end
end
