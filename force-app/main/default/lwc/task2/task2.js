import { LightningElement ,wire,track} from 'lwc';
import getAllOpps from '@salesforce/apex/Task2.getLeadAndOpportunityGroupedResults';
const  columns = [{
    label: 'Owner ID',
    fieldName: 'ownerid',
    type: 'text',
    sortable: true
},
{
    label: 'Owner Name',
    fieldName: 'OwnerName',
    type: 'text',
    sortable: true
},
{
    label: 'Total Leads',
    fieldName: 'TotalLeads',
    type: 'text',
    sortable: true
},
{
    label: 'Total Opportunities',
    fieldName: 'TotalOpps',
    type: 'text',
    sortable: true
},
{
    label: 'Last Created Date (Opp)',
    fieldName: 'LastOpp',
    type: 'text',
    sortable: true
},
{
    label: 'Total Value ',
    fieldName: 'TotalAmount',
    type: 'text',
    sortable: true
}

];
export default class DatatableEx12 extends LightningElement {
    
    @track col =columns;
    @track Alldata ;
    @wire(getAllOpps)
    wiredOpps({
        error,
        data
    }) {
        if (data) {
            this.Alldata = data;
        } else if (error) {
            this.error = error;
        }
    }
}