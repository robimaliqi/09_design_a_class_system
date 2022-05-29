class MyContacts
  def initialize(contact)
    @contacts = contact
  end

  def extract_phone_numbers
    #scans contents for phone numbers and returns the phone numbers
    return @contacts.list_entries.flat_map do |entry|
       entry.contents.scan(/[07][0-9]{10}/)
    end
  end
end