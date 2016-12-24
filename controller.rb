require('sinatra')
require('sinatra/contrib/all')

codes = {
    ppWg: :mum,
    xKpg: :anna,
    dPlz: :dad
}

get '/' do
    @message = "" unless @message
    erb(:index)
end

post '/' do
    code = params['code'].to_sym
    page_name = codes[code]

    if page_name
        erb(page_name) 
    else 
        @message = "code not found...try again"
        erb(:index)
    end
        
end