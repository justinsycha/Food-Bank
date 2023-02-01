from cumulusci.robotframework.pageobjects import pageobject, ListingPage


@pageobject(page_type="Listing", object_name="MyObject__c")
class MyObjectListingPage(ListingPage):
    def click_on_the_row_with_name(self, name):
        xpath='xpath://a[@title="{}"]'.format(name)
        self.selenium.wait_until_page_contains_element(xpath)
        self.selenium.click_link(xpath)
        self.salesforce.wait_until_loading_is_complete()