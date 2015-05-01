require 'rails_helper'

RSpec.describe Timer, type: :model do
  subject { FactoryGirl.build(:timer) }

  it { should have_db_column(:url_key).of_type(:string).with_options(null: false) }
  it { should have_db_index(:url_key).unique(true) }

  it { should have_db_column(:admin_key).of_type(:string).with_options(null: false) }

  it { should have_db_column(:time).of_type(:integer) }

  describe 'geneate admin key' do

    it 'should be a string of 10 chars' do
      subject.valid?

      expect(subject.admin_key).to_not be_empty
      expect(subject.admin_key.length).to eql(20)
    end
  end

  describe 'generate url key' do
    before(:all) do
      Timer::URL_KEY_RING.replace([ *0..9, *'a'..'z' ].join)
    end

    it 'url_key should be eql to `1` if incr is `1`' do
      allow($redis).to receive(:incr).and_return(1)
      subject.valid?

      expect(subject.url_key).to eql('1')
    end

    it 'url_key should be eql to `z` if incr is `35`' do
      allow($redis).to receive(:incr).and_return(35)
      subject.valid?

      expect(subject.url_key).to eql('z')
    end

    it 'url_key should be eql to `01` if incr is `36`' do
      allow($redis).to receive(:incr).and_return(36)
      subject.valid?

      expect(subject.url_key).to eql('01')
    end
  end

end
