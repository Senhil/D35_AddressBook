package com.jdbc.addressbook;

import org.junit.jupiter.api.Test;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import static com.jdbc.addressbook.AddressBookService.IOService.DB_IO;
import static org.junit.jupiter.api.Assertions.*;

class AddressBookServiceTest
{
    @Test
    public void givenAddressBookInDB_WhenRetrieved_ShouldMatchThePeopleCount() {
        AddressBookService addressBookService = new AddressBookService();
        List<AddressBookData> addressBookDataList = addressBookService.readAddressBookData(DB_IO);
        assertEquals(7,addressBookDataList.size());
    }
    @Test
    public void givenNewPhoneNumber_ShouldUpdateTheRecordAndSyncWithDataBase() throws AddressBookException {
        AddressBookService addressBookService = new AddressBookService();
        addressBookService.readAddressBookData(DB_IO);
        addressBookService.updateRecord("Kaynat", "9967587648");
        boolean result = addressBookService.checkRecordSyncWithDB("Kaynat");
        assertTrue(result);
    }
    @Test
    public void givenDate_ShouldRetrieveTheAddressBookRecord_BasedOnTheParticularRange() {
        AddressBookService addressBookService = new AddressBookService();
        addressBookService.readAddressBookData(DB_IO);
        LocalDate startDate = LocalDate.of(2018, 01, 01);
        LocalDate endDate = LocalDate.now();
        List< AddressBookData> employeePayrollData= addressBookService.readEmployeePayrollForDateRange(DB_IO, startDate, endDate);
        assertEquals(0,employeePayrollData.size());
    }
    @Test
    public void givenCity_ShouldRetrieveTheNumberOfContacts_BasedOnCity() {
        AddressBookService addressBookService = new AddressBookService();
        addressBookService.readAddressBookData(DB_IO);
        Map<String, Double> contactsByCity = addressBookService.contactsByCity(DB_IO);
        System.out.println(contactsByCity.containsKey("Noida")+" "+contactsByCity.containsValue(2.0));
        assertFalse(contactsByCity.containsKey("Noida") && contactsByCity.containsValue(2.0));
    }

    @Test
    public void givenCity_ShouldRetrieveTheNumberOfContacts_BasedOnState() {
        AddressBookService addressBookService = new AddressBookService();
        addressBookService.readAddressBookData(DB_IO);
        Map<String, Double> contactsByState = addressBookService.contactsByState(DB_IO);
        System.out.println(contactsByState.containsKey("UP")+" "+contactsByState.containsValue(2.0));
        assertFalse(contactsByState.containsKey("UP") &&
                contactsByState.containsValue(2.0));
    }
    @Test
    public void givenNewContact_ShouldAddIntoTheAddressBookDataBase() {
        AddressBookService addressBookService = new AddressBookService();
        addressBookService.readAddressBookData(DB_IO);
        addressBookService.addNewContact("Afreen","Makandar","Family",
                "991456588","Belgam","Karnataka","1214404","aparv@gmail.com",LocalDate.now());
        boolean result = addressBookService.checkRecordSyncWithDB("Afreen");
        assertTrue(result);
    }
}