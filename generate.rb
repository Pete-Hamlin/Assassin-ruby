#!/usr/bin/env ruby

require "google_drive"

class Contract
  def initialize(assassin, target, weapon, location)
    @assassin = assassin
    @target = target
    @weapon = weapon
    @location = location
  end

  def display
    puts "  Assassin: #{@assassin}
    Target: #{@target}
    Weapon: #{@weapon}
    Location: #{@location}"
  end

  def mailer
    puts "Sending message to #{@assassin}..."
    hook = "<--INSERT SLACK WEBHOOK HERE-->"
    msg = "{\"channel\": \"#{@assassin}\", \"text\":\"Assassin: #{@assassin}\nTarget: #{@target}\nWeapon: #{@weapon}\nLocation: #{@location}\"}"
    `curl -X POST --data-urlencode \'payload=#{msg}\' #{hook}`
    # puts msg
  end
end


# Creates a session. This will prompt the credential via command line for the
# first time and save it to config.json file for later usages.
session = GoogleDrive.saved_session("config.json")

# Pull data from drive - If the form changes this key will also need to be updated
puts "Getting spreadsheet data..."
ws = session.spreadsheet_by_key("<--INSERT SPREADSHEET KEY HERE-->").worksheets[0]
puts "Got data!"


# Define arrays
assassin = Array.new()
check = Array.new()
arr = Array.new(3) {Array.new()}


(2..ws.num_rows).each do |row|
   assassin << ws[row, 5]
   arr[0] << ws[row, 2]
    arr[1] << ws[row, 3]
    arr[2] << ws[row, 4]
    check << ws[row, 2]
end

arr.each do |field|
  field.shuffle!
end

contracts = Array.new()
(0..assassin.length).each do |x|
  if check[x] === arr[0][x]
    arr[0].push(arr[0][x])
    arr[0].delete_at(x)
  end
  contracts << Contract.new(assassin[x], arr[0][x],  arr[1][x], arr[2][x])
end


contracts.each do |contract|
  contract.display    # DEBUG (mostly in case of human error)
  contract.mailer
end
