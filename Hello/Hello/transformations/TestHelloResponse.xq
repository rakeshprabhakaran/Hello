(:: pragma bea:global-element-parameter parameter="$testHello1" element="ns0:testHello" location="../../NorthBoundInterfaces/hellodata_1_0.xsd" ::)
(:: pragma bea:global-element-return element="ns0:testHello" location="../../NorthBoundInterfaces/hellodata_1_0.xsd" ::)

declare namespace xf = "http://tempuri.org/Hello/transformation/HelloResponse/";
declare namespace ns0 = "http://soa.o2.co.uk/hellodata_1";

declare function xf:HelloResponse($testHello1 as element(ns0:testHello),
    $message as xs:string,
    $transId as xs:string)
    as element(ns0:testHello) {
        <ns0:testHello>
            <ns0:name>{data($message)}{ data($testHello1/ns0:name) }</ns0:name>
        </ns0:testHello>
};

declare variable $testHello1 as element(ns0:testHello) external;
declare variable $message as xs:string external;
declare variable $transId as xs:string external;

xf:HelloResponse($testHello1,
    $message,
    $transId)