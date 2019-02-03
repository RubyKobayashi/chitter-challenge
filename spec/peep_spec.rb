require 'peep'



RSpec.describe Peep do
  describe '.all' do
    it 'returns a list of peeps' do
      connection = PG.connect(dbname: 'peeps_test')
      peep = Peep.create(peep: 'This is my first peep')
      Peep.create(peep: 'This is my second peep')
      Peep.create(peep: 'This is my third peep')

      peeps = Peep.all
      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      # expect(peeps.last.id).to eq peeps.first.id
      expect(peeps.last.peep).to eq 'This is my first peep'
      expect(peeps.first.peep).to eq 'This is my third peep'

    
    end
  end
end
