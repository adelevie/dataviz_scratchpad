# dataviz_scratchpad

Zero to charts in about a minute. 

## Benefits

Use Ruby to manipulate and visualize data.

## Installation

Clone the repo and `cd` into it, then:

```sh
$ bundle
```

Run the server:

```sh
$ ruby server.rb
```

Visit [http://localhost:4567](http://localhost:4567) to see the sample chart.

## Usage

Data collection occurs in `data.rb`. Currently, there is some sample data:

```ruby
class Data
  def self.all
    [
      {
        :name => "Washington",
        :start => "1789-04-29", 
        :end => "1797-03-03"
      },
      {
        :name => "Adams",
        :start => "1797-03-03", 
        :end => "1801-03-03"
      },
      {
        :name => "Jefferson",
        :start => "1801-03-03", 
        :end => "1809-03-03"
      }
    ]
  end
end
```

Customize this file to pull in data from whichever source you want. Download JSON from somewhere and parse it. Parse some XML. Have fun!

`Data.all` is called inside the simple Sinatra server (`server.rb`):

```ruby
DATA = Data.all

get '/' do
  @data = DATA
  erb :index
end
```

Edit this as needed. Or just pipe your data through `Data.all` and don't edit this file. It's all up to you.

Finally, edit `views/index.erb`. This is where most of the chart-based excited happens:

```erb
<script src="//www.google.com/jsapi"></script>
<script src="chartkick.js"></script>

<%=
  
data = @data  
  
timeline data.map {|d| [d[:name], d[:start], d[:end]]}
  
%>

```

The last expression in the `<%= %>` will be displayed.

Consult the [Chartkick docs](http://chartkick.com/) to learn how to make all sorts of beautiful data visualizations.

### Sandbox

Need to understand your data a little better? Run `$ ruby sandbox.rb` to open a [Pry](https://github.com/pry/pry) repl with your data already loaded.

```ruby
➜  dataviz_scratchpad  ruby sandbox.rb 

From: /Users/alandelevie/prototyping/dataviz_scratchpad/sandbox.rb @ line 10 :

     5: 
     6: require 'pry'
     7: 
     8: data = Data.all
     9: 
 => 10: binding.pry

[1] pry(main)> data
=> [{:name=>"Washington", :start=>"1789-04-29", :end=>"1797-03-03"},
 {:name=>"Adams", :start=>"1797-03-03", :end=>"1801-03-03"},
 {:name=>"Jefferson", :start=>"1801-03-03", :end=>"1809-03-03"}]
```

### Customizing

The server is a Sinatra app. Add views to the views folder and new server routes as needed.

