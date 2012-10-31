(:: pragma bea:global-element-parameter parameter="$testFault1" element="ns2:testFault" location="../../NorthBoundInterfaces/hellodata_1_0.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Fault" location="../schemas/commonsoapfault.xsd" ::)

declare namespace xf = "http://tempuri.org/Hello/transformation/TestFaultFaultResponse/";
declare namespace ns0 = "http://schemas.xmlsoap.org/soap/envelope/";
declare namespace ns1 = "http://soa.o2.co.uk/coredata_1";
declare namespace ns2 = "http://soa.o2.co.uk/hellodata_1";

declare function xf:TestFaultFaultResponse($testFault1 as element(ns2:testFault),
    $transId as xs:string)
    as element(ns0:Fault) {
        <ns0:Fault>
            <faultcode>100</faultcode>
            <faultstring>Fault Message</faultstring>
            <detail>
                <ns2:testFaultFault>
                    <ns1:SOAFaultOriginator>{ data($testFault1/ns2:name) }</ns1:SOAFaultOriginator>
           			<ns1:SOAFaultCode>100</ns1:SOAFaultCode>
					<ns1:faultDescription>Fault Message</ns1:faultDescription>
                    <ns1:SOATransactionID>{ $transId }</ns1:SOATransactionID>
                </ns2:testFaultFault>
            </detail>
        </ns0:Fault>
};

declare variable $testFault1 as element(ns2:testFault) external;
declare variable $transId as xs:string external;

xf:TestFaultFaultResponse($testFault1,
    $transId)