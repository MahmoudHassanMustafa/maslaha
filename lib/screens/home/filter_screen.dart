import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'components/filter_section.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:flutter_date_picker_timeline/flutter_date_picker_timeline.dart';

enum PriceFilteringOptions { FixedValue, Range }
enum AvailabilityFilteringOptions { AvailableNow, AvailableLater }

class FilterScreen extends StatefulWidget {
  static const routeName = '/search-filters';

  const FilterScreen({Key? key}) : super(key: key);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  PriceFilteringOptions? _priceFilteringOption =
      PriceFilteringOptions.FixedValue;
  var _priceRangeValues = SfRangeValues(125.0, 560.0);
  var _isPriceFilterActive = false;

  double _distanceFilter = 1;
  var _isDistanceFilterActive = false;

  AvailabilityFilteringOptions? _availabilityFilteringOption =
      AvailabilityFilteringOptions.AvailableNow;

  var _isRatingFilterActive = false;

  var _isAvailabilityFilterActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.red),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Fliters',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.close,
              size: 30,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                FilterSection(
                  filterTitle: 'Price',
                  filterDescription:
                      'Helps you find an affordable service provider that suits your needs, specify a fixed price or a range to efficiently manage your budget.',
                  enabled: _isPriceFilterActive,
                  onEnabled: (toggler) {
                    setState(() {
                      _isPriceFilterActive = toggler;
                    });
                  },
                  children: [
                    RadioListTile<PriceFilteringOptions>(
                      title: const Text(
                        'Amount',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: const Text('Fixed value for price.'),
                      value: PriceFilteringOptions.FixedValue,
                      groupValue: _priceFilteringOption,
                      selected: _priceFilteringOption ==
                              PriceFilteringOptions.FixedValue
                          ? true
                          : false,
                      toggleable: true,
                      dense: true,
                      onChanged: _isPriceFilterActive
                          ? (newOption) {
                              setState(() {
                                _priceFilteringOption = newOption;
                              });
                            }
                          : null,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 14),
                      child: TextFormField(
                        onChanged: (val) {
                          setState(() {});
                        },
                        keyboardType: TextInputType.number,
                        enabled: _priceFilteringOption ==
                                PriceFilteringOptions.FixedValue
                            ? true
                            : false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffE4DCDC)),
                              borderRadius: BorderRadius.circular(15)),
                          hintText: "Enter price you want in L.E.",
                          hintStyle:
                              TextStyle(color: Colors.black45, fontSize: 14),
                          prefixIcon: Icon(
                            Icons.attach_money_outlined,
                            color: Color(0xffA0BBF0),
                          ),
                        ),
                      ),
                    ),
                    RadioListTile<PriceFilteringOptions>(
                      title: const Text(
                        'Range',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: const Text('Range value for price.'),
                      value: PriceFilteringOptions.Range,
                      groupValue: _priceFilteringOption,
                      selected:
                          _priceFilteringOption == PriceFilteringOptions.Range
                              ? true
                              : false,
                      toggleable: true,
                      dense: true,
                      onChanged: _isPriceFilterActive
                          ? (newOption) {
                              setState(() {
                                _priceFilteringOption = newOption;
                              });
                            }
                          : null,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: SfRangeSliderTheme(
                        data: SfRangeSliderThemeData(
                          activeLabelStyle: TextStyle(
                            color: _priceFilteringOption ==
                                        PriceFilteringOptions.Range &&
                                    _isPriceFilterActive
                                ? Colors.black
                                : Colors.grey,
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                          ),
                          inactiveLabelStyle: TextStyle(
                            color: _priceFilteringOption ==
                                        PriceFilteringOptions.Range &&
                                    _isPriceFilterActive
                                ? Colors.black
                                : Colors.grey,
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        child: SfRangeSlider(
                          min: 50.0,
                          max: 10000.0,
                          values: _priceRangeValues,
                          showTicks: true,
                          showLabels: true,
                          labelFormatterCallback: (actualValue, formattedText) {
                            formattedText = actualValue == 10000
                                ? '${actualValue.toInt()}+ L.E.'
                                : '${actualValue.toInt()} L.E.';

                            return formattedText;
                          },
                          endThumbIcon: FittedBox(
                            alignment: Alignment.centerRight,
                            fit: BoxFit.scaleDown,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(7, 4, 4, 4),
                              child: Icon(Icons.arrow_forward_ios,
                                  color: Colors.white),
                            ),
                          ),
                          startThumbIcon: FittedBox(
                            alignment: Alignment.centerRight,
                            fit: BoxFit.scaleDown,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(9, 4, 0, 4),
                              child: Icon(Icons.arrow_back_ios,
                                  color: Colors.white),
                            ),
                          ),
                          enableTooltip: true,
                          tooltipShape: SfPaddleTooltipShape(),
                          tooltipTextFormatterCallback:
                              (actualValue, formattedText) {
                            formattedText = '${actualValue.toInt()} LE.';
                            return formattedText;
                          },
                          onChanged: _priceFilteringOption ==
                                      PriceFilteringOptions.Range &&
                                  _isPriceFilterActive
                              ? (newRange) {
                                  setState(() {
                                    _priceRangeValues = newRange;
                                  });
                                }
                              : null,
                        ),
                      ),
                    ),
                  ],
                ),
                FilterSection(
                  filterTitle: 'Distance',
                  filterDescription:
                      'Find service providers nearest to you, or maybe a little far up to 20km from your location, it\'s your call, use the slider to set the desired distance.',
                  enabled: _isDistanceFilterActive,
                  onEnabled: (toggler) {
                    setState(() {
                      _isDistanceFilterActive = toggler;
                    });
                  },
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: SfSliderTheme(
                        data: SfSliderThemeData(
                          activeLabelStyle: TextStyle(
                            color: _priceFilteringOption ==
                                        PriceFilteringOptions.Range &&
                                    _isPriceFilterActive
                                ? Colors.black
                                : Colors.grey,
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                          ),
                          inactiveLabelStyle: TextStyle(
                            color: _priceFilteringOption ==
                                        PriceFilteringOptions.Range &&
                                    _isPriceFilterActive
                                ? Colors.black
                                : Colors.grey,
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        child: SfSlider(
                          min: 1,
                          max: 20,
                          value: _distanceFilter,
                          showTicks: true,
                          showLabels: true,
                          labelFormatterCallback: (actualValue, formattedText) {
                            formattedText = actualValue == 10000
                                ? '${actualValue.toInt()}+ km.'
                                : '${actualValue.toInt()} km.';
                            return formattedText;
                          },
                          enableTooltip: true,
                          tooltipShape: SfPaddleTooltipShape(),
                          tooltipTextFormatterCallback:
                              (actualValue, formattedText) {
                            formattedText = '${actualValue.toInt()} km.';
                            return formattedText;
                          },
                          onChanged: _isDistanceFilterActive
                              ? (newValue) {
                                  setState(() {
                                    _distanceFilter = newValue;
                                  });
                                }
                              : null,
                        ),
                      ),
                    ),
                  ],
                ),
                FilterSection(
                  filterTitle: 'Rating',
                  filterDescription:
                      'Control rating of the shown service providers as you desire.',
                  enabled: _isRatingFilterActive,
                  onEnabled: (toggler) {
                    setState(() {
                      _isRatingFilterActive = toggler;
                    });
                  },
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: RatingBar.builder(
                        initialRating: 1,
                        allowHalfRating: true,
                        maxRating: 5,
                        minRating: 0,
                        direction: Axis.horizontal,
                        itemCount: 5,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                        itemSize: 35,
                        itemBuilder: (_, index) {
                          return Icon(
                            Icons.star_rate_rounded,
                            color: _isRatingFilterActive
                                ? Colors.amber
                                : Colors.grey,
                          );
                        },
                        glow: false,
                        ignoreGestures: !_isRatingFilterActive,
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ),
                  ],
                ),
                FilterSection(
                  filterTitle: 'Availability',
                  filterDescription:
                      'Make your order in a quick manner; only show service providers available and ready to take your order, want it later? No problem, we got you covered.',
                  enabled: _isAvailabilityFilterActive,
                  onEnabled: (toggler) {
                    setState(() {
                      _isAvailabilityFilterActive = toggler;
                    });
                  },
                  children: [
                    RadioListTile<AvailabilityFilteringOptions>(
                      title: const Text(
                        'Currently Available',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: const Text(
                          'Only online and available service providers.'),
                      value: AvailabilityFilteringOptions.AvailableNow,
                      groupValue: _availabilityFilteringOption,
                      selected: _availabilityFilteringOption ==
                              AvailabilityFilteringOptions.AvailableNow
                          ? true
                          : false,
                      toggleable: true,
                      dense: true,
                      onChanged: _isAvailabilityFilterActive
                          ? (newOption) {
                              setState(() {
                                _availabilityFilteringOption = newOption;
                              });
                            }
                          : null,
                    ),
                    RadioListTile<AvailabilityFilteringOptions>(
                      title: const Text(
                        'Available later',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: const Text('Choose the time that suits you.'),
                      value: AvailabilityFilteringOptions.AvailableLater,
                      groupValue: _availabilityFilteringOption,
                      selected: _availabilityFilteringOption ==
                              AvailabilityFilteringOptions.AvailableLater
                          ? true
                          : false,
                      toggleable: true,
                      dense: true,
                      onChanged: _isAvailabilityFilterActive
                          ? (newOption) {
                              setState(() {
                                _availabilityFilteringOption = newOption;
                              });
                            }
                          : null,
                    ),
                    Visibility(
                      visible: _availabilityFilteringOption ==
                              AvailabilityFilteringOptions.AvailableLater
                          ? true
                          : false,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 14),
                        child: FlutterDatePickerTimeline(
                          startDate: DateTime.now(),
                          endDate: DateTime.now().add(Duration(days: 30)),
                          initialSelectedDate: DateTime.now(),
                          unselectedItemBackgroundColor: Colors.grey.shade400,
                          unselectedItemTextStyle:
                              TextStyle(color: Colors.white),
                          selectedItemBackgroundColor: Colors.blue,
                          selectedItemTextStyle: TextStyle(color: Colors.white),
                          onSelectedDateChange: (selectedTime) {
                            print(selectedTime);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isPriceFilterActive = false;
                        _isDistanceFilterActive = false;
                        _isRatingFilterActive = false;
                        _isAvailabilityFilterActive = false;
                      });
                    },
                    child: Text('Reset'),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.red.shade400),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Apply'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
