import { LightningElement, track, wire } from 'lwc';
import getMapOfData from '@salesforce/apex/clsGetCitiesData.returnMapOfListValues';

export default class ShowMapOfListValuesDemo extends LightningElement {
    @track mapOfListValues = [];

    @wire(getMapOfData)
    mapOfData({data, error}) {
        if(data) {
            for(let key in data) {
                // Preventing unexcepted 
                if (data.hasOwnProperty(key)) { // Filtering the data in the loop
                    this.mapOfListValues.push({key: key, value: data[key]});
                }
            }
        }
        else if(error) {
            window.console.log(error);
        }
    }
}