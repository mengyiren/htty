require 'htty/cli/commands/cd'
require 'htty/cli/commands/path_set'

RSpec.describe HTTY::CLI::Commands::Cd do
  describe 'class' do
    let :klass do
      subject.class
    end

    it 'should be an alias_for the expected command' do
      expect(klass.alias_for).to eq(HTTY::CLI::Commands::PathSet)
    end

    it 'should have the expected aliases' do
      expect(klass.aliases).to eq([])
    end

    it 'should belong to the expected category' do
      expect(klass.category).to eq('Navigation')
    end

    it 'should have the expected command_line' do
      expect(klass.command_line).to eq('cd')
    end

    it 'should have the expected command_line_arguments' do
      expect(klass.command_line_arguments).to eq('PATH')
    end

    it 'should have the expected help' do
      expect(klass.help).to eq("Alias for \e[1mpath[-set]\e[0m")
    end

    it 'should have the expected help_extended' do
      expect(klass.help_extended).to eq("Alias for \e[1mpath[-set]\e[0m.")
    end

    it 'should have the expected see_also_commands' do
      expect(klass.see_also_commands).to eq([HTTY::CLI::Commands::PathSet])
    end

    describe 'build_for' do
      it 'should correctly handle a valid, unabbreviated command line' do
        built = klass.build_for('cd foo', session: :the_session)
        expect(built).to be_instance_of(klass)
        expect(built.arguments).to eq(['foo'])
        expect(built.session).to eq(:the_session)
      end

      it 'should correctly handle a command line with a bad command' do
        built = klass.build_for('x bar', session: :another_session)
        expect(built).to eq(nil)
      end
    end
  end
end
