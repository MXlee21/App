import getBaseInfo from './getBaseInfo';
import getOSAndName from './getOSAndName/index.native';
import {GetDeviceInfo} from './types';

const getDeviceInfo: GetDeviceInfo = () => ({
        ...getBaseInfo(),
        ...getOSAndName(),
        device_name: 'Desktop',
    });

export default getDeviceInfo;
