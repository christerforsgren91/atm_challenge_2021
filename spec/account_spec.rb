require './lib/account'


describe Account do
    
it 'it is expected to have an expiry date on initialize' do
    expected_date = Date.today.next_year(5).strftime("%m/%y")
    expect(subject.exp_date).to eq expected_date
    end

it 'check the length of the number'do
    number = (subject.pin_code)
    number_length = Math.log10(number).to_i + 1
    expect(number_length).to eq 4
end

end


