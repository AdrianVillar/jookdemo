({
	getSalesOrders : function(component,recordId, size) {
        var action = null;
        var state = null;
        action = component.get("c.getSalesOrders");
        action.setParams({
            id : recordId,
            size : size
        });

        action.setCallback(this, function(response) {
            state = response.getState();
            debugger;
            if (component.isValid() && state === "SUCCESS") {
                var valueObj = JSON.parse(response.getReturnValue());
                component.set("v.wrapper", valueObj.d.results);

            }
        });

        $A.enqueueAction(action);
    }
})
