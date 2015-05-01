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

  describe 'generate id & url key' do
    before(:all) do
      Timer::URL_KEY_RING.replace([*0..9, *'a'..'z' ].join)
    end

    it 'should set id' do
      $redis.set('timer:ids', Timer.maximum(:id) || 0)

      expect(subject).to be_valid
      expect { subject.save }.to_not raise_error
    end

    it 'id `1` should be key `1`' do
      allow($redis).to receive(:incr).and_return(1)
      subject.valid?

      expect(subject.id).to eql(1)
      expect(subject.url_key).to eql('1')
    end

    it 'id `35` should be key `z`' do
      allow($redis).to receive(:incr).and_return(35)
      subject.valid?

      expect(subject.id).to eql(35)
      expect(subject.url_key).to eql('z')
    end

    it 'id `36` should be key `01`' do
      allow($redis).to receive(:incr).and_return(36)
      subject.valid?

      expect(subject.id).to eql(36)
      expect(subject.url_key).to eql('01')
    end
  end

end
