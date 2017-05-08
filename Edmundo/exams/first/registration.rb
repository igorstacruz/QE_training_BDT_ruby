require_relative 'distance_conversion'

def singleton
  @singleton ||= Registration.new
end


class Registration
    include DistanceConversion

    attr_accessor :username, :password

    LOG_PATH = "execution.log"

  def initialize
    @username = nil
    @id = nil
    @users = []

    @conversions = {  
       a: "from millemeters to centimeters",
       b: "from centimeters to meters",
       c: "from meters to kilometers"}

    @log = File.new(LOG_PATH, "w+")
    @log.write "Init Log\n"
    @log.close
  end

  def set_user
    print "Please insert username: "
    username = gets.chomp

    if username =~ /^[a-z0-9]{1,11}$/ 
          @username = username 

          print "Please insert password: "
          password = gets.chomp
          @password = password

          @users.push username: username, password: password          
          return true
    else
      puts "username invalid, please try again."    
      return false     
    end
  end

  def amount_user
    print "How many users will be registered? bettwen 3 and 15: "
    amount = gets.chomp.to_i
    save_log("Tried to register #{amount} users.")
    if  (3...15) === amount      
      amount.times do 
        message = "added user #{@users.last}" if set_user
        puts message
        save_log message
        
      end
      save_log "#{@users.length} users saves successfully."
    else
      puts "invalid amount of users"      
      save_log "Invalid amount of users to register."
    end    

  end

  def convertion_type

    @users.each do |user|

      puts "Which type of conversion '#{user[:username]}' user wants?"
      @conversions.each{ |key, value| puts "#{key}. #{value}"}
      
      option = gets.chomp
      save_log "User '#{user[:username]}' choose '#{option}' conversation type.'"

      user[:conversion] =  option.to_sym if option =~ /^[abc]{1}$/      
    end    
  end

  def user_convertion
    users = @users.select{ |user| user[:conversion] != nil }
    users.each do |user|
      puts "User '#{user[:username]}' wants to calculate #{@conversions[user[:conversion]]}."
      print "enter value to be converted: "
      value = gets.chomp.to_f
      save_log "User '#{user[:username]}' wants to calculate '#{value}' #{@conversions[user[:conversion]]}."
      message = convert(user, value)
      puts message
      save_log message
    end

    puts "Users that don't want conversion:'"
    p @users - users
    
    save_log "Users that don't want conversion:'"
    save_log "#{@users - users}"
  end

  def convert(user, value)
    if user[:conversion] == :a
      milli_centi(value)
    elsif user[:conversion] == :b
      centi_meters value
    else
      meters_km(value)
    end
  end

  def save_log(message)
    log = File.open(LOG_PATH, "a")
    log.write "#{message}\n"
    log.close
  end
  
end


singleton.amount_user
singleton.convertion_type
singleton.user_convertion
