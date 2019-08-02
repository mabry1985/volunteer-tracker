class Volunteer
  attr_accessor :name, :volunteer
  attr_reader :id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @volunteer = attributes.fetch(:volunteer)
    @id = attributes.fetche(:id)
  end

  def ==(volunteer_to_compare)
    (self.name() == volunteer_to_compare()) && (self.volunteer == volunteer_to_compare.project.id())
  end

  def self.all
  returned_volunteers = DB.exec("SELECT * FROM volunteers;")
  volunteers = []
  returned_volunteers.each() do |volunteer|
    name = volunteer.fetch("name")
    project_id = volunteer.fetch("project_id").to_i
    id = volunteer.fetch("id").to_i
    volunteers.push(volunteer.new({:name => name, :project_id => project_id, :id => id}))
  end
  volunteers
  end

  def save
    result = DB.exec("INSERT INTO volunteers (name, project_id) VALUES ('#{@name}', #{@project_id}) RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def self.find(id)
    volunteer = DB.exec("SELECT * FROM volunteers WHERE id = #{id};").first
    if volunteer
      name = volunteer.fetch("name")
      project_id = volunteer.fetch("project_id").to_i
      id = volunteer.fetch("id").to_i
      volunteer.new({:name => name, :project_id => project_id, :id => id})
    else
      nil
    end
  end

  def update(name, project_id)
    @name = name
    @project_id = project_id
    DB.exec("UPDATE volunteers SET name = '#{@name}', project_id = #{@project_id} WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM volunteers WHERE id = #{@id};")
  end

  def self.clear
    DB.exec("DELETE FROM volunteers *;")
  end

  def self.find_by_project(project_id)
    volunteers = []
    returned_volunteers = DB.exec("SELECT * FROM volunteers WHERE project_id = #{project_id};")
    returned_volunteers.each() do |volunteer|
      name = volunteer.fetch("name")
      id = volunteer.fetch("id").to_i
      volunteers.push(volunteer.new({:name => name, :project_id => project_id, :id => id}))
    end
    volunteers
  end

  def project
    project.find(@project_id)
  end

end
