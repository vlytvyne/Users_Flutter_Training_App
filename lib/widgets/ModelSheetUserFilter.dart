import 'package:architecture/data/filters/UserFilter.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ModelSheetUserFilter extends StatefulWidget {

	UserFilter filter;
	final Function(UserFilter) onApply;

	ModelSheetUserFilter({Key key, @required UserFilter filter, @required this.onApply}) : super(key: key) {
		this.filter = filter.clone();
	}

	@override
	_ModelSheetUserFilterState createState() => _ModelSheetUserFilterState();
}

class _ModelSheetUserFilterState extends State<ModelSheetUserFilter> {

	@override
	Widget build(BuildContext context) =>
			SingleChildScrollView(
				child: Padding(
					padding: const EdgeInsets.all(20),
					child: Container(
						height: 300,
						child: Column(
							children: <Widget>[
								_buildFilterTitle(),
								_buildCheckbox(
									widget.filter.showMen,
									'Show men',
									(value) => setState(() => widget.filter.showMen = value)
								),
								_buildCheckbox(
									widget.filter.showWomen,
									'Show women',
									(value) => setState(() => widget.filter.showWomen = value)
								),
								_buildSwitch(
									widget.filter.ascendingOrder,
									'Ascending order',
									(value) => setState(() => widget.filter.ascendingOrder = value)
								),
								_buildApplyButton(context)
							],
						),
					),
				),
			);

	Align _buildFilterTitle() =>
			Align(
					alignment: Alignment.centerLeft,
					child: Text('Filters', style: TextStyle(fontSize: 40),)
			);

	Widget _buildCheckbox(value, title, onChanged) =>
			CheckboxListTile(
				value: value,
				title: Text(title),
				onChanged: onChanged,
			);

	Widget _buildSwitch(value, title, onChanged) =>
			SwitchListTile(
				title: Text(title),
				value: value,
				onChanged: onChanged,
			);

	Expanded _buildApplyButton(BuildContext context) =>
			Expanded(
				child: Align(
					alignment: Alignment.bottomRight,
					child: MaterialButton(
						minWidth: 100,
						height: 40,
						child: Text('Apply', style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 20),),
						onPressed: () => widget.onApply(widget.filter),
					),
				),
			);
}