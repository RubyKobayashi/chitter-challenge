require 'pg'
class Chitter

  attr_reader :peep, :id

  def initialize(peep:, id:)
    @peep = peep
  end

  def self.create(peep:)
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'peeps_test')
                 else
                   PG.connect(dbname: 'peeps')
                 end
    result = connection.exec("INSERT INTO peeps(peep) VALUES('#{peep}') RETURNING id, peep;")
    Chitter.new(id: result[0]['id'], peep: result[0]['peep'])
  end
end
