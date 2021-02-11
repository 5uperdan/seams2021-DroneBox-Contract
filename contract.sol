pragma solidity >=0.4.22 <0.7.0;
pragma experimental ABIEncoderV2;

contract DroneBox {

    struct LatLng {
        bytes16 lat;
        bytes16 lng;
    }
    
    event DroneReport(
        uint32 updateTime,
        uint32 deviceID,
        address add,
        bytes16 lat,
        bytes16 lng
    );
    
    event WitnessReport(
        uint32 updateTime,
        uint32 deviceID,
        address add,
        bytes16 lat,
        bytes16 lng,
        uint16 detectionRadius, // metres
        uint32[] detectedDrones
    );
    
    event FlyZone(
        uint32 uid,
        uint32 startTime,
        uint32 endTime,
        bool restricted,
        LatLng[] area
    );

    // from drone 
    function drone_report(uint32 updateTime, uint32 deviceID, bytes16 lat, bytes16 lng) public {
        emit DroneReport(updateTime, deviceID, msg.sender ,lat, lng);
    }
    
    // from witness
    function witness_report(uint32 updateTime, uint32 deviceID, bytes16 lat, bytes16 lng, uint16 detectionRadius, uint32[] memory detectedDrones) public {
        emit WitnessReport(updateTime, deviceID, msg.sender, lat, lng, detectionRadius, detectedDrones);
    }
    
    // from authority
    function fly_zone(uint32 uid, uint32 startTime, uint32 endTime, bool restricted, LatLng[] memory area) public {
        emit FlyZone(uid, startTime, endTime, restricted, area);
    }
}
