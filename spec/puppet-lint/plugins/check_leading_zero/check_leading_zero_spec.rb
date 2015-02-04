require 'spec_helper'

describe 'leading_zero' do
  let (:msg) { 'unquoted number with leading zero' }

  context 'with fix disabled' do
    context 'no unquoted numbers with leading zero' do
      let (:code) {
        <<-EOS
        $foo = '010'
        $bar = 10
        $baz = 0
        EOS
      }

      it 'should not detect any problems' do
        expect(problems).to have(0).problems
      end
    end

    context 'unquoted numbers with leading zero' do
      let (:code) {
        <<-EOS
        $foo = 010
        EOS
      }

      it 'should detect a single problem' do
        expect(problems).to have(1).problem
      end

      it 'should create a warning' do
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
      let (:code) {
        <<-EOS
        $foo = '010'
        $bar = 10
        $baz = 0
        EOS
      }

      it 'should not detect any problems' do
        expect(problems).to have(0).problems
      end

      it 'should not modify the manifest' do
        expect(manifest).to eq(code)
      end
    end

    context 'unquoted numbers with leading zero' do
      let (:code) {
        <<-EOS
        $foo = 010
        EOS
      }

      it 'should detect a single problem' do
        expect(problems).to have(1).problem
      end

      it 'should fix the problem' do
        expect(problems).to contain_fixed(msg).on_line(1).in_column(16)
      end

      it 'should should use undef' do
        expect(manifest).to eq(
          <<-EOS
        $foo = '010'
          EOS
        )
      end
    end
  end
end
