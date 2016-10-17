updates = [
  ["http://www.brq.com","http://www.4mstech.com"],
  ["http://infra.brq.com","gam.4mstech.com:3000"],
  ["BRQ IT Services","GAM 4MSTech"],
  ["BRQ IT Services","GAM 4MSTech"],
  ["http://sitebeta.brq.com/wp-content/uploads/2013/11/logo-brq.png","http://gam.4mstech.com:3000/Logo03-01.jpg"],
  ["brq","4MSTech"],
  ["(21) 3211-8964","(21) dial-tech"],
  ["(21) 3211-9837","(21) dial-tech"],
  ["3211-9800","2220-0001"],
  ["BRQ","4MSTech"]]



# SqlTemplate.where(:id => 7).all.each do |t|
SqlTemplate.all.each do |t|
  # t = SqlTemplate.find(7)
  puts "Analisando #{t.id} - #{t.path}.."
  # puts "antes: #{t.body}"
  updates.each do |u|
  	puts "  Substituindo [#{u[0]}] por [#{u[1]}]..."
  	t.body = t.body.gsub u[0],u[1]
  end
  # puts "depois: #{t.body}"
  t.save!
end
