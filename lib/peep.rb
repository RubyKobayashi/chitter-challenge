require 'pg'

class Peep

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
    Peep.new(id: result[0]['id'], peep: result[0]['peep'])
  end

  def self.all
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'peeps_test')
                 else
                   PG.connect(dbname: 'peeps')
                 end
    result = connection.exec('SELECT * FROM peeps ORDER BY id DESC;')
    result.map do |peep|
      Peep.new(id: peep['id'], peep: peep['peep'])
    end
  end

  end
