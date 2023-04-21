require 'spec_helper'

describe 'leading_zero' do
  let(:msg) { 'unquoted number with leading zero' }

  context 'with fix disabled' do
    context 'no unquoted numbers with leading zero' do
      let(:code) do
        <<-EOS
        $foo = '010'
        $bar = 10
        $baz = 0
        EOS
      end

      it 'does not detect any problems' do
        expect(problems).to have(0).problems
      end
    end

    context 'unquoted numbers with leading zero' do
      let(:code) do
        <<-EOS
        $foo = 010
        EOS
      end

      it 'detects a single problem' do
        expect(problems).to have(1).problem
      end

      it 'creates a warning' do
        expect(problems).to contain_warning(msg).on_line(1).in_column(16)
      end
    end
  end

  context 'with fix enabled' do
    before do
      PuppetLint.configuration.fix = true
    end

    after do
      PuppetLint.configuration.fix = false
    end

    context 'no unquoted numbers with leading zero' do
      let(:code) do
        <<-EOS
        $foo = '010'
        $bar = 10
        $baz = 0
        EOS
      end

      it 'does not detect any problems' do
        expect(problems).to have(0).problems
      end

      it 'does not modify the manifest' do
        expect(manifest).to eq(code)
      end
    end

    context 'unquoted numbers with leading zero' do
      let(:code) do
        <<-EOS
        $foo = 010
        EOS
      end

      it 'detects a single problem' do
        expect(problems).to have(1).problem
      end

      it 'fixes the problem' do
        expect(problems).to contain_fixed(msg).on_line(1).in_column(16)
      end

      it 'shoulds use undef' do
        expect(manifest).to eq(
          <<-EOS,
        $foo = '010'
          EOS
        )
      end
    end
  end
end
