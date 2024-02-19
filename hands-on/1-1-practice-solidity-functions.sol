import "forge-std/console.sol";

contract C {
    function x() external {
        if (condition) {
            console.log("condition was met!");
        }
    }
}
