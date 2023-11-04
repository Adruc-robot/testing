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
end
