# rubocop:disable Style/LineEndConcatenation
# rubocop:disable Style/MultilineOperationIndentation
# rubocop:disable Style/StringLiterals

require 'rails_helper'

RSpec.describe Article, type: :model do
  describe '#body_html' do
    let(:article) { Fabricate(:article, body: <<~MARKDOWN) }
      # テストmarkdown
      ## これはテストmarkdownです
      テストテスト
      [テスト](https://proconist.net)
    MARKDOWN

    it 'should return html' do
      expect(article.body_html).to eq <<~HTML
        <h1>テストmarkdown</h1>

        <h2>これはテストmarkdownです</h2>

        <p>テストテスト
        <a href="https://proconist.net" target="_blank">テスト</a></p>
      HTML
    end
  end

  describe '#description' do
    let(:article) { Fabricate(:article, body: <<~MARKDOWN) }
      # 夏目漱石
      ## こころ
      私はその人を常に先生と呼んでいた。だからここでもただ先生と書くだけで本名は打ち明けない。
      これは世間を憚かる遠慮というよりも、その方が私にとって自然だからである。
      私はその人の記憶を呼び起すごとに、すぐ「先生」といいたくなる。筆を執とっても心持は同じ事である。
      よそよそしい頭文字などはとても使う気にならない。
    MARKDOWN

    it 'should return short html' do
      expect(article.description).to eq "夏目漱石\n" +
        "こころ\n" +
        "私はその人を常に先生と呼んでいた。だからここでもただ先生と書くだけで本名は打ち明けない。\n" +
        "これは世間を憚かる遠慮というよりも、その方が私にとって自然だからである。..."
    end
  end

  describe '#date' do
    subject do
      article.date
    end

    let(:created_date) { Time.zone.parse('2016-01-23') }
    let(:article) { Fabricate(:article, created_at: created_date) }

    it { should eq '2016年01月23日' }
  end

  describe '#published?' do
    subject do
      article.published?
    end

    context 'published article' do
      let(:article) { Fabricate(:article, published_at: Time.zone.parse('2015-12-31')) }
      it { should eq true }
    end

    context 'draft article' do
      let(:article) { Fabricate(:article, published_at: Time.zone.parse('2112-09-03')) }
      it { should eq false }
    end
  end

  describe '#draft?' do
    subject do
      article.draft?
    end

    context 'published article' do
      let(:article) { Fabricate(:article, published_at: Time.zone.parse('2015-12-31')) }
      it { should eq false }
    end

    context 'draft article' do
      let(:article) { Fabricate(:article, published_at: Time.zone.parse('2112-09-03')) }
      it { should eq true }
    end
  end
end
