({
	doInit : function(component, event, helper) {
        var recordId = component.get('v.recordId');
        var size = component.get('v.size');
        helper.getSalesOrders(component,recordId, size);
    }
})
