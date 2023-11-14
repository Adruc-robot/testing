module ApplicationHelper
    def buttonOverride(record, thetext)
        if record.persisted? 
            # old record
            "Save #{thetext}"
        else
            # new record
            "Create #{thetext}"
        end
    end

    def pieChartMaker(inputArray, denominator)
        @base = [ [0,100,50,20],[39,100,50,20],[60,100,50],[120,100,25],[240,100,50],[275,100,25],[300,76,72] ]
        @pieStr = "<div style=\"width: 400px;height: 400px;border-radius: 50%;background-image: conic-gradient("
        @endStr = ")\"</div>"
        @hm = 1
        @prevVal = 0
        @cnt = 0
        @tV = 0
        @length = ""
        @newLeg = ""
        @middleBits = ""
        @first = true
        inputArray.each do |item|
            if @cnt == @base.length - 1
                @tV = 0
            else
                @tV += 1
            end
            if @first
                #get the stock values
                @f1 = @base[@cnt][0].to_s+","+@base[@cnt][1].to_s+"%,"+@base[@cnt][2].to_s+"%"
                if @cnt != @base.length - 2
                    @f2 = @base[@tV][0].to_s+","+@base[@tV][1].to_s+"%,"+@base[@tV][2].to_s+"%"
                else
                    #@f2 = @base[@tV][0].to_s+","+(1+rand(100)).to_s+"%,"+(1+rand(100)).to_s+"%"
                    #@f2 = @base[@tV][0].to_s+","+(@base[@tV][1] - 40).to_s+"%,"+@base[@tV][2].to_s+"%"
                    @f2 = @base[@tV][0].to_s+","+(@base[@tV][1] - 40).to_s+"%,"+(@base[@tV][2] - 5).to_s+"%"
                end
                @prev = @f2
            else
                #need to store the randoms somewhere 
                @f1 = @prev
                #@f2 = @base[@tV][0].to_s+","+(1+rand(100)).to_s+"%,"+(1+rand(100)).to_s+"%"
                #@f2 = @base[@tV][0].to_s+","+(@base[@tV][1] - 40).to_s+"%,"+@base[@tV][2].to_s+"%"
                @f2 = @base[@tV][0].to_s+","+(@base[@tV][1] - 40).to_s+"%,"+(@base[@tV][2] - 10).to_s+"%"
                @prev = @f2
            end
            #@cnt = @cnt + 1
            if @cnt == @base.length - 1
                @cnt = 0
                @first = false
            else
                @cnt += 1
            end
            @crVal = (item[1] / denominator * 100).round
      
            #this code definitely needs revision
            if @hm == inputArray.length - 1
              @middleBits = "hsl("+@f1+") "+(@crVal + @prevVal).to_s+ "%, hsl("+@f2+") "+(@crVal + @prevVal).to_s+"%"
              @pieStr += @middleBits
            elsif @hm < inputArray.length - 1
              @middleBits = "hsl("+@f1+") "+(@crVal + @prevVal).to_s+ "%, hsl("+@f2+") "+(@crVal + @prevVal).to_s+"%, "
              @pieStr += @middleBits
            end
      
            @prevVal = @crVal + @prevVal
            @hm = @hm + 1
            #@pieStr += @middleBits
            #@newLeg += "<div><div style=\"color:hsl("+@f1+");background-color:hsl("+@f1+")\">X</div><div>"+item[0]+": $"+item[1].to_s+"</div></div>"
            @newLeg += "<div><div style=\"color:hsl("+@f1+");background-color:hsl("+@f1+")\">X</div><div>"+item[0].to_s+": $"+item[1].to_s+"</div></div>"
            #Rails.logger.debug @f1
        end
            @pieStr += @endStr
            returnArr = { pieChart: @pieStr, legend: @newLeg}

    end
end
