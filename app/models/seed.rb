class Seed < ActiveRecord::Base

  # Initialize the schema without using migrations
  def self.all
    initialize_schema
    super
  end # def self.all

  def self.select(*fields)
    initialize_schema
    super(fields)
  end

  def self.initialize_schema
    unless self.connection.tables.include?("seeds")
      self.connection.create_table(:seeds, :id => false) do |t|
        t.string :version
      end
    end
  end



end # class Seed
