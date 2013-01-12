# GSM
###### 2013-01-13
###### telco, net

World's most popular standard for mobile telephony systems (80% of mobile market uses the standard)

 * both signaling and speech channels are digital
 * second generation (2G) of mobile phone system
 * GSM release '97 - added packet data capabilities via GPRS
 * GSM release '99 - higher data transmission via EDGE
 * UMTS (Universal Mobile Telecommunications System) - 3G mobile cellular technology for networks based on GSM standards

## Network Structure
The network is structured into a number of discrete sections:

 * the base station subsystem (**BSS**) - handles traffic and signaling between a mobile phone and the NSS
 * the network and switching subsystem (**NSS**) - part of the network most similar to a fixed network (VOICE)
 * the **GPRS core network** - optional part fot packet based Internet connections (NON-VOICE)
 * operations support system (**OSS**) for maintenance

![GSM network](https://raw.github.com/jreisinger/audit/master/wiki_files/gsm_structure.png)

See [this picture](https://raw.github.com/jreisinger/audit/master/wiki_files/gsm_communication.jpg) for **GSM communication**.

**BSC** = Base Station Controller

 * intelligence behind the BTSs (allocation of radio channels, measurements from the mobile phones, handover control from BTS to BTS)
 * concentrator towards the mobile switching center (MSC)
 * the **most robust** element in the BSS
 * often based on a distributed computer architecture

**PCU** = Packet Control Unit

 * late addition to the GSM standard
 * processing tasks for packet data

**MSC** = Mobile Switching Centre

**HLR** = Home Location Register

 * database of subscribers
 * a central database that contains details of each mobile phone subscriber that is authorized to use the GSM and/or WCDMA core network of this PLMN

**VLR** = Visitor Location Register

 * register of roaming subscribers

**AUC**

 * database of authentification keys

**EIR**

 * stolen devices (phones) register

**SS7** = Signaling System #7

 * a set of telephone signaling protocols
 * main purpose: setup/tear down telephone calls
 * other uses: number portability, SMS, etc.

**SGSN** = Serving GPRS Support Node

 * delivery of data packets from and to mobile stations withing its geographical service area
 * packet routing and transfer, mobility management, logical link management, authentication and charging functions

**GGSN** = Gateway GPRS Support Node

 * **main component** ot the GPRS network
 * internetworking between the GPRS network and external packet switched networks
 * router to a sub-network

## See also

 * [Mobile network](http://en.wikipedia.org/wiki/Mobile_network)
 * P. Luptak: [Strucny prehlad do bezpecnosti GSM](http://www.nethemba.com/gsm-zranitelnosti.pdf) (in Slovak)
