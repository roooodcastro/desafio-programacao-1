# frozen_string_literal: true

RSpec.describe TitleHelper do
  describe '#title' do
    subject { helper.title(title) }

    let(:title) { 'Hello World!' }

    it { is_expected.to be_a String }

    it 'should return a h1 header tag with the title' do
      is_expected.to have_tag(:h1) do
        with_text(title)
        with_tag(:hr)
      end
    end

    it 'should correctly set the content_for :title' do
      subject
      expect(helper.content_for(:title)).to eq title
    end
  end
end
